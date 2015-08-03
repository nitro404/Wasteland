
//	@file Version: 1.0
//	@file Name: spawnOnBeacons.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [int(0 = button 0 etc)]

#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407

disableSerialization;

private ["_respawnPosition", "_switch", "_display", "_buttonZero", "_buttonOne", "_buttonTwo", "_buttonThree", "_buttonFour"];

_switch = _this select 0;

_display = uiNamespace getVariable "RespawnSelectionDialog";
_buttonZero = _display displayCtrl respawn_Town_Button0;
_buttonOne = _display displayCtrl respawn_Town_Button1;
_buttonTwo = _display displayCtrl respawn_Town_Button2;
_buttonThree = _display displayCtrl respawn_Town_Button3;
_buttonFour = _display displayCtrl respawn_Town_Button4;

_respawnPosition = [];

_searchForBeacon = {
	_button = _this select 0;
	_allBeacons = pvar_beaconListBlu + pvar_beaconListRed + pvar_beaconListIndep;
	_result = false;

	{
		_playerName = _x select 0;
		if ( ( ctrlText _button ) == _playerName ) then {
			_result = _x;
		};
	} forEach _allBeacons;

	_result
};

_buttonClicked = false;

switch(_switch) do {
    case 0:{ _buttonClicked = _buttonZero };
    case 1:{ _buttonClicked = _buttonOne };
    case 2:{ _buttonClicked = _buttonTwo };
    case 3:{ _buttonClicked = _buttonThree };
    case 4:{ _buttonClicked = _buttonFour };
};

_beacon = [_buttonClicked] call _searchForBeacon;
_respawnPosition = _beacon select 1;
_respawnDir = _beacon select 4;

2 cutText ["HALO jump activated. Open your chute before you hit the ground! Press E to detach chute.", "PLAIN DOWN", 5];
[player, [_respawnPosition select 0, _respawnPosition select 1, 500], _respawnDir] execVM "client\functions\HALODir.sqf";
respawnDialogActive = false;
closeDialog 0;

sleep 5;

_mins = floor(60 * (daytime - floor(daytime)));

[
	"[COMMUNITY NAME HERE]","Spawn Beacon",
	format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;

//Altimeter reading at top right
while { ((getposATL player)select 2) > 1 } do {
	hintsilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];
};

if(((getposATL player)select 2) < 1) then {
	hintsilent "";
};
