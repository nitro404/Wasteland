//	@file Version: 1.0
//	@file Name: vehicleCleanupManager.sqf
//	@file Author: nitro glycerine
//	@file Created: 13/10/2015 6:25 PM

if(!isServer) exitWith { };

while { true } do {

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "Motorcycle");

	sleep 1;

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "Car");

	sleep 1;

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "Truck");

	sleep 1;

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "APC");

	sleep 1;

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "Tank");

	sleep 1;

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "Helicopter");

	sleep 1;

	{
		[_x] call cleanupVehicle;
	} forEach (allMissionObjects "Plane");

	sleep 60;
};
