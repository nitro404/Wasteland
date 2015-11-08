
//	@file Version: 1.0
//	@file Name: cleanBeaconArrays.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [string(ownerUID)]

private["_playerUID", "_playerSide", "_result"];

_playerUID = _this select 0;
_playerSide = _this select 1;
_result = false;

if(_playerSide == "WEST") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			pvar_beaconListBlu set [_forEachIndex, objNull];
			pvar_beaconListBlu = pvar_beaconListBlu - [objNull];
			publicVariable "pvar_beaconListBlu";
			_result = true;
		};
	} forEach pvar_beaconListBlu;
};

if(_playerSide == "EAST") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			pvar_beaconListRed set [_forEachIndex, objNull];
			pvar_beaconListRed = pvar_beaconListRed - [objNull];
			publicVariable "pvar_beaconListRed";
			_result = true;
		};
	} forEach pvar_beaconListRed;
};

if(_playerSide == "GUER") then {
	{
		if(str(_playerUID) == str(_x select 3)) then {
			pvar_beaconListIndep set [_forEachIndex, objNull];
			pvar_beaconListIndep = pvar_beaconListIndep - [objNull];
			publicVariable "pvar_beaconListIndep";
			_result = true;
		};
	} forEach pvar_beaconListIndep;
};

_result
