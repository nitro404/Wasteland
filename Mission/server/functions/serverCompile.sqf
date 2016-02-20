//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isServer) exitWith { };

diag_log format["Compiling Server-Side Scripts..."];

randomPosition = compile preprocessFileLineNumbers "server\functions\randomPosition.sqf";
randomObject = compile preprocessFileLineNumbers "server\functions\randomObject.sqf";

createMissionLocation = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionLocation.sqf";
createWaitCondition = compile preprocessFileLineNumbers "server\missions\factoryMethods\createWaitCondition.sqf";
randomAIWeapon = compile preprocessFileLineNumbers "server\missions\factoryMethods\randomAIWeapon.sqf";
randomAIWeapons = compile preprocessFileLineNumbers "server\missions\factoryMethods\randomAIWeapons.sqf";
createAIUnit = compile preprocessFileLineNumbers "server\missions\factoryMethods\createAIUnit.sqf";
createAIGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createAIGroup.sqf";
defendArea = compile preprocessFileLineNumbers "server\functions\defendArea.sqf";
vehicleMission = compile preprocessFileLineNumbers "server\missions\vehicleMission.sqf";
geoCacheMission = compile preprocessFileLineNumbers "server\missions\geoCacheMission.sqf";
missionController = compile preprocessFileLineNumbers "server\missions\missionController.sqf";

randomVehicleWeapons = compile preprocessFileLineNumbers "server\spawning\randomVehicleWeapons.sqf";
spawnVehicle = compile preprocessFileLineNumbers "server\spawning\spawnVehicle.sqf";
spawnWeaponCrate = compile preprocessFileLineNumbers "server\spawning\spawnWeaponCrate.sqf";
spawnObject = compile preprocessFileLineNumbers "server\spawning\spawnObject.sqf";
respawnVehicles = compile preprocessFileLineNumbers "server\functions\respawnVehicles.sqf";
respawnBoats = compile preprocessFileLineNumbers "server\functions\respawnBoats.sqf";
respawnHelicopters = compile preprocessFileLineNumbers "server\functions\respawnHelicopters.sqf";
respawnPlanes = compile preprocessFileLineNumbers "server\functions\respawnPlanes.sqf";

// ARMA2Net Scripts
#ifdef __A2NET__
arma2NetTime = compile preprocessFileLineNumbers "server\functions\netTime.sqf";
#endif

if(isDedicated) then {
	cleanupVehicle = compile preprocessFileLineNumbers "server\functions\cleanupVehicle.sqf";

	objectCleanupManager = compile preprocessFileLineNumbers "server\functions\objectCleanupManager.sqf";
	vehicleCleanupManager = compile preprocessFileLineNumbers "server\functions\vehicleCleanupManager.sqf";
};

diag_log format["Finished Compiling Server-Side Scripts!"];
