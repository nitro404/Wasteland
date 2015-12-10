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
			pvar_beaconListBlu = [pvar_beaconListBlu, _forEachIndex] call BIS_fnc_removeIndex;
			publicVariable "pvar_beaconListBlu";
			_result = true;
		};
	} forEach pvar_beaconListBlu;
};

if(_playerSide == "EAST") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			pvar_beaconListRed = [pvar_beaconListRed, _forEachIndex] call BIS_fnc_removeIndex;
			publicVariable "pvar_beaconListRed";
			_result = true;
		};
	} forEach pvar_beaconListRed;
};

if(_playerSide == "GUER") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			pvar_beaconListIndep = [pvar_beaconListIndep, _forEachIndex] call BIS_fnc_removeIndex;
			publicVariable "pvar_beaconListIndep";
			_result = true;
		};
	} forEach pvar_beaconListIndep;
};

_result
