
//	@file Version: 1.0
//	@file Name: cleanBeaconArrays.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [string(ownerUID)]

private["_currBeaconOwnerUID"];

_currBeaconOwnerUID = _this select 0;

{
	if(str(_currBeaconOwnerUID) == str(_x select 3)) then {
		pvar_beaconListBlu set [_forEachIndex, objNull];
    	pvar_beaconListBlu = pvar_beaconListBlu - [objNull];
    	publicVariable "pvar_beaconListBlu";
    };

} forEach pvar_beaconListBlu;

{
    if(str(_currBeaconOwnerUID) == str(_x select 3)) then {
    	pvar_beaconListRed set [_forEachIndex, objNull];
        pvar_beaconListRed = pvar_beaconListRed - [objNull];
        publicVariable "pvar_beaconListRed";
    };
} forEach pvar_beaconListRed;

{
    if(str(_currBeaconOwnerUID) == str(_x select 3)) then {
    	pvar_beaconListIndep set [_forEachIndex, objNull];
        pvar_beaconListIndep = pvar_beaconListIndep - [objNull];
        publicVariable "pvar_beaconListIndep";
    };
} forEach pvar_beaconListIndep;
