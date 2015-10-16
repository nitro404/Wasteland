//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isServer) exitWith { };

#include "setup.sqf"

diag_log format["WASTELAND SERVER - Compiling Server-Side Scripts..."];

// Utility Scripts
randomPosition = compile preprocessFileLineNumbers "server\functions\randomPosition.sqf";
randomObject = compile preprocessFileLineNumbers "server\functions\randomObject.sqf";

// Mission Scripts
createMissionLocation = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionLocation.sqf";
createClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compile preprocessFileLineNumbers "server\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\deleteClientMarker.sqf";
createSmallGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\midGroup.sqf";
createLargeGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\largeGroup.sqf";
defendArea = compile preprocessFileLineNumbers "server\functions\defendArea.sqf";
vehicleMission = compile preprocessFileLineNumbers "server\missions\vehicleMission.sqf";
geoCacheMission = compile preprocessFileLineNumbers "server\missions\geoCacheMission.sqf";
missionController = compile preprocessFileLineNumbers "server\missions\missionController.sqf";

// Spawning Scripts
randomWeapons = compile preprocessFileLineNumbers "server\spawning\randomWeapon.sqf";
spawnVehicle = compile preprocessFileLineNumbers "server\spawning\spawnVehicle.sqf";
spawnWeaponCrate = compile preprocessFileLineNumbers "server\spawning\spawnWeaponCrate.sqf";
spawnObject = compile preprocessFileLineNumbers "server\spawning\spawnObject.sqf";
respawnVehicles = compile preprocessFileLineNumbers "server\functions\respawnVehicles.sqf";
respawnHelicopters = compile preprocessFileLineNumbers "server\functions\respawnHelicopters.sqf";

// Player Management Scripts
server_playerDied = compile preprocessFileLineNumbers "server\functions\serverPlayerDied.sqf";

// Event Handlers
createLootMoney = compile preprocessFileLineNumbers "server\functions\dropLoot.sqf";

// ARMA2Net Scripts
#ifdef __A2NET__
arma2NetTime = compile preprocessFileLineNumbers "server\functions\netTime.sqf";
#endif

if(isDedicated) then {
	cleanupManager = compile preprocessFileLineNumbers "server\cleanupManager.sqf";
};

diag_log format["WASTELAND SERVER - Finished Compiling Server-Side Scripts!"];
