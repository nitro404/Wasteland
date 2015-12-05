//	@file Version: 1.0
//	@file Name: objectCleanupManager.sqf
//	@file Author: nitro glycerine
//	@file Created: 13/10/2015 6:25 PM

private["_objects"];

if(!isServer) exitWith { };

while { true } do {

	{
		if(_x isKindOf "Man") then {
			[_x, 600] call cleanupObject;
		}
		else {
			[_x, 300] call cleanupObject;
		};

		sleep 0.05;
	} forEach allDead;

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach entities "EvMoney";

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach entities "Fuel_can";

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach entities "Suitcase";

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach allMissionObjects "CZ_Backpack_EP1";

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach allMissionObjects "CZ_VestPouch_EP1";

	sleep 1;

	{
		[_x, 1800] call cleanupObject;
	} forEach allMissionObjects "WeaponHolder";

	sleep 1;

	{
		[_x, 600] call cleanupObject;
	} forEach allMissionObjects "CraterLong";

	sleep 60;
};
