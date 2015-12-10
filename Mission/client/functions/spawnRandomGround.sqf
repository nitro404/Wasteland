//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19

waitUntil { !isNil "bis_fnc_init" };

private["_town", "_townName"];

_town = townList call BIS_fnc_selectRandom;

_position = [getMarkerPos (_town select 0), 1, _town select 1, 1, 0, 0, 0] call BIS_fnc_findSafePos;
player setPosATL [_position select 0, _position select 1, 0];

respawnDialogActive = false;
closeDialog 0;

[_town select 2] spawn spawnInfoText;
