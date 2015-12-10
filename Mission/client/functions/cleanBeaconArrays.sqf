//	@file Version: 1.0
//	@file Name: cleanBeaconArrays.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [string(ownerUID), side]

private["_playerUID", "_playerSide", "_result"];

_playerUID = _this select 0;
_playerSide = _this select 1;
_result = false;

if(_playerSide == "WEST") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			spawnBeaconsBluFor = [spawnBeaconsBluFor, _forEachIndex] call BIS_fnc_removeIndex;
			publicVariable "spawnBeaconsBluFor";
			_result = true;
		};
	} forEach spawnBeaconsBluFor;
};

if(_playerSide == "EAST") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			spawnBeaconsOpFor = [spawnBeaconsOpFor, _forEachIndex] call BIS_fnc_removeIndex;
			publicVariable "spawnBeaconsOpFor";
			_result = true;
		};
	} forEach spawnBeaconsOpFor;
};

if(_playerSide == "GUER") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			spawnBeaconsIndependent = [spawnBeaconsIndependent, _forEachIndex] call BIS_fnc_removeIndex;
			publicVariable "spawnBeaconsIndependent";
			_result = true;
		};
	} forEach spawnBeaconsIndependent;
};

_result
