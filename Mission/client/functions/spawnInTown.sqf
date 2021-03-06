//	@file Version: 1.0
//	@file Name: spawnInTown.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, nitro glycerine
//	@file Created: 20/11/2012 05:19
//	@file Modified: 2/12/2015 9:19 AM
//	@file Args: [buttonIndex]

#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407

disableSerialization;

private["_display", "_townName", "_spawnButtons", "_position"];

_display = uiNamespace getVariable "RespawnSelectionDialog";

_spawnButtons = [
	_display displayCtrl respawn_Town_Button0,
	_display displayCtrl respawn_Town_Button1,
	_display displayCtrl respawn_Town_Button2,
	_display displayCtrl respawn_Town_Button3,
	_display displayCtrl respawn_Town_Button4
];

{
	_name = _x select 2;
	if(ctrlText (_spawnButtons select _this) == _name) exitWith {
		_townName = _name;
		_position = [getMarkerPos (_x select 0), 5, _x select 1, 1, 0, 0, 0] call BIS_fnc_findSafePos;
		player setPosATL [_position select 0, _position select 1, 0];
		respawnDialogActive = false;
		closeDialog 0;
	};
} forEach townList;

[_townName] spawn spawnInfoText;
