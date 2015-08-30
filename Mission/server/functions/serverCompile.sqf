//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith { };

#include "setup.sqf"

diag_log format["WASTELAND SERVER - Compiling Server-Side Scripts..."];

// Utility Scripts
randomPosition = compile preprocessFileLineNumbers "server\functions\randomPosition.sqf";
randomObject = compile preprocessFileLineNumbers "server\functions\randomObject.sqf";

// Main Mission Scripts
mission_APC = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_APC.sqf";
mission_Heli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Heli.sqf";
mission_LightArmVeh = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightArmVeh.sqf";
mission_LightTank = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightTank.sqf";
mission_MBT = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_MBT.sqf";
mission_Outpost = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Outpost.sqf";
mission_SupplyDrop = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_SupplyDrop.sqf";

// Side Mission Scripts
mission_AirWreck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_AirWreck.sqf";
mission_Truck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_Truck.sqf";
mission_ReconVeh = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_ReconVeh.sqf";
mission_WepCache = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_WepCache.sqf";
mission_SmallHeli = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_SmallHeli.sqf";

// Factory Scripts
createMissionLocation = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionLocation.sqf";
createClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compile preprocessFileLineNumbers "server\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\deleteClientMarker.sqf";
createSmallGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\midGroup.sqf";
createLargeGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\largeGroup.sqf";
createMissionVehicle = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionVehicle.sqf";
createSupplyDrop = compile preprocessFileLineNumbers "server\missions\factoryMethods\createSupplyDrop.sqf";
createCargoItem = compile preprocessFileLineNumbers "server\missions\factoryMethods\createCargoItem.sqf";
defendArea = compile preprocessFileLineNumbers "server\functions\defendArea.sqf";

// Spawning Scripts
randomWeapons = compile preprocessFileLineNumbers "server\spawning\randomWeapon.sqf";
spawnVehicle = compile preprocessFileLineNumbers "server\spawning\spawnVehicle.sqf";
spawnWeaponCrate = compile preprocessFileLineNumbers "server\spawning\spawnWeaponCrate.sqf";
spawnObject = compile preprocessFileLineNumbers "server\spawning\spawnObject.sqf";
respawnVehicles = compile preprocessFileLineNumbers "server\functions\respawnVehicles.sqf";

// Player Management Scripts
server_playerDied = compile preprocessFileLineNumbers "server\functions\serverPlayerDied.sqf";

// Event Handlers
createLootMoney = compile preprocessFileLineNumbers "server\functions\dropLoot.sqf";

// ARMA2Net Scripts
#ifdef __A2NET__
arma2NetTime = compile preprocessFileLineNumbers "server\functions\netTime.sqf";
#endif

diag_log format["WASTELAND SERVER - Finished Compiling Server-Side Scripts!"];
