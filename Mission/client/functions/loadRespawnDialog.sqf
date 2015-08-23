//	@file Version: 1.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
#define respawn_PlayersInTown_Text0 3408
#define respawn_PlayersInTown_Text1 3409
#define respawn_PlayersInTown_Text2 3410
#define respawn_PlayersInTown_Text3 3411
#define respawn_PlayersInTown_Text4 3412
#define respawn_More_Button 3413

waitUntil{!isnil "bis_fnc_init"};
disableSerialization;

private["_player","_town","_radius","_name","_enemyCount","_friendlyCount","_side","_dynamicControlsArray", "_enemyPresent","_tempArray", "_text", "_players", "_playerArray"];

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];
_respawnText = _display displayCtrl respawn_Content_Text;
_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;
_beaconBlockDistance = 300;

if(playerSide in [west]) then {_side = "Blufor"};
if(playerSide in [east]) then {_side = "Opfor"};
if(str(playerSide) == "GUER") then {_side = "Independent"};
_respawnText ctrlSetStructuredText parseText (format["You are on %1.<br/>Please select a spawn point.",_side]);
respawnDialogActive = true;

_dynamicControlsArray = [
	[respawn_Town_Button0,respawn_PlayersInTown_Text0],
    [respawn_Town_Button1,respawn_PlayersInTown_Text1],
    [respawn_Town_Button2,respawn_PlayersInTown_Text2],
    [respawn_Town_Button3,respawn_PlayersInTown_Text3],
    [respawn_Town_Button4,respawn_PlayersInTown_Text4]];

{
    _button = _display displayCtrl (_x select 0);
    _button ctrlSetText format[""];
    _button ctrlShow false;
} foreach _dynamicControlsArray;

_friendlyTowns = [];
_tempArray = [];
showBeacons = false;
respawnPage = 0;
_items_per_page = 5;

_find_occupied_towns = {
	_towns = [];
	{
		_pos = getMarkerPos (_x select 0);
		_name = _x select 2;
		_rad = _x select 1;
		_friendlyCount = 0;
		_enemyCount = 0;
		_playerArray = [];

		{

			if((getPosATL _x distance _pos) < _rad) then
			{
				if(side _x == playerSide AND alive _x) then
				{
					if ( str playerSide == "GUER" && group _x != group player ) then {
						_enemyCount = _enemyCount + 1;
					}
					else {
						_friendlyCount = _friendlyCount + 1;
						_playerArray set [count _playerArray, name _x];
					};
				} else {
					_enemyCount = _enemyCount + 1;
				};
			};

		} forEach allUnits;

		if(_friendlyCount > 0) then {
			_towns set [count _towns, [_name, _playerArray, (_enemyCount > 0)]];
		};

	} forEach townList;

	_towns
};

_find_beacons = {
	_beacons = _this select 0;
	_result = [];

	{
		_centrePos = _x select 1;
		_enemyCount = 0;
		_beacon = _x;
		_beaconSide = _x select 6;
		_ownerId = _x select 3;
		_squadIds = [];

		if(str playerSide == "GUER") then {
			{
				_squadIds set [count _squadIds, (getPlayerUID _x)];
			} forEach (units group player);
		};

		{
			if((getPosATL _x distance _centrePos) < _beaconBlockDistance) then {
				if(side _x == playerSide) then {
					if(str playerSide == "GUER" && group _x != group player) then {
						_enemyCount = _enemyCount + 1;
					};
				}
				else {
					_enemyCount = _enemyCount + 1;
				};
			};
		} forEach allUnits;

		if(str playerSide == _beaconSide && (str playerSide != "GUER" || (_ownerId in _squadIds || (getPlayerUID player) == _ownerId))) then {
			_result set [count _result, [_beacon, (_enemyCount > 0)]];
		};
	} forEach _beacons;

	_result
};

_format_players = {
	_players = _this select 0;
	_str = '';
	{
		_str = _str + _x + ', ';
	} forEach _players;

	_a = toArray _str;
	_a set [( count _a - 2 ), 32];
	_a set [( count _a - 1 ), 32];
	_str = toString _a;

	_str
};

_reset_buttons = {
	_item_count = _this;
	// Hide all buttons/text that won't be used
	{
		if ( _forEachIndex >= _item_count ) then {
			_button = _display displayCtrl (_x select 0);
			_text = _display displayCtrl (_x select 1);
			_button ctrlShow false;
			_text ctrlShow false;
		};
	} forEach _dynamicControlsArray;

	true
};

_sort_items = {
	_items = _this;
	_unblocked = [];
	_blocked = [];

	{
		if ( _x select 2 ) then {
			_blocked set [count _blocked, _x];
		}
		else {
			_unblocked set [count _unblocked, _x];
		};
	} forEach _items;

	_unblocked + _blocked;
};

_show_buttons = {
	_items = (_this select 0) call _sort_items;
	_items_per_page = _this select 1;
	_page = _this select 2;
	_possible_pages = ceil (count _items / _items_per_page) - 1;

	if ( _possible_pages < _page ) then {
		_page = 0;
	};

	_more_button = _display displayCtrl respawn_More_Button;
	if ( _possible_pages > 0 ) then {
		_more_button ctrlShow true;
	}
	else {
		_more_button ctrlShow false;
	};


	_offset = _items_per_page * _page;
	(count _items - _offset) call _reset_buttons; // Will hide the buttons we won't use
	for [{_i = 0}, {_i < _items_per_page && _i < (count _items) - _offset}, {_i = _i+1}] do {
		_item   = _items select _i + _offset;
		_button = _display displayCtrl (_dynamicControlsArray select _i select 0);
		_text   = _display displayCtrl (_dynamicControlsArray select _i select 1);

		// Set the button details
		_button ctrlSetText	(_item select 0);
		_text ctrlSetText (_item select 1);

		_text ctrlShow true;
		_button ctrlShow true;

		_blocked = (_item select 2);
		ctrlEnable [(_dynamicControlsArray select _i select 0), ! _blocked ]; // Blocked
	};

	_page
};

while {respawnDialogActive} do
{
    _timeText = [time/60/60] call BIS_fnc_timeToString;
    _missionUptimeText ctrlSetText format["Mission Uptime: %1", _timeText];

	if(!showBeacons) then {
		_occupiedTowns = [] call _find_occupied_towns;

		// Format the text
		{
			_x set [1, [_x select 1] call _format_players];
		} forEach _occupiedTowns;

		respawnPage = [_occupiedTowns, 5, respawnPage] call _show_buttons;

	} else {
		_beacon_array = nil;
		_players_array = nil;
		switch (str playerSide) do {
			case "WEST": { _beacon_array = pvar_beaconListBlu; };
			case "EAST": { _beacon_array = pvar_beaconListRed; };
			case "GUER": { _beacon_array = pvar_beaconListIndep; };
		};

		_beacons = [_beacon_array] call _find_beacons;

		_result = [];
		{
			_name = _x select 0 select 0;
			_town = _x select 0 select 5;
			_blocked = _x select 1;

			_result set [count _result, [_name, _town, _blocked]];
		} forEach _beacons;
		respawnPage = [_result, 5, respawnPage] call _show_buttons;
	};
    sleep 0.1;
};