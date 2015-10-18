//	@file Version: 1.0
//	@file Name: objectCleanupManager.sqf
//	@file Author: nitro glycerine
//	@file Created: 13/10/2015 6:25 PM

if(!isServer) exitWith { };

while { true } do {

	{
		if(_x isKindOf "Man") then {
			[_x, 900] call cleanupObject;
		}
		else {
			[_x, 300] call cleanupObject;
		};
	} forEach allDead;

	sleep 1;

	{
		[_x, 600] call cleanupObject;
	} forEach (allMissionObjects "CraterLong");

	sleep 1;

	{
		[_x, 1800] call cleanupObject;
	} forEach (allMissionObjects "WeaponHolder");

	sleep 1;

	{
		[_x, 900, 250] call cleanupObject;
	} forEach (allMissionObjects "Evmoney");

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach (allMissionObjects "Fuel_can");

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach (allMissionObjects "Suitcase");

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach (allMissionObjects "CZ_VestPouch_EP1");

	sleep 1;

	{
		[_x, 1200] call cleanupObject;
	} forEach (allMissionObjects "CZ_Backpack_EP1");

	sleep 60;
};
