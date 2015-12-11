//	@file Version: 1.0
//	@file Name: clientCompile.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

// Event handlers
onRespawn = compile preprocessfile "client\clientEvents\onRespawn.sqf";
onKilled = compile preprocessfile "client\clientEvents\onKilled.sqf";
onKeyPress = compile preprocessFile "client\clientEvents\onKeyPress.sqf";

// Player details and actions
loadPlayerMenu = compile preprocessFile "client\systems\playerMenu\init.sqf";
playerSpawn = compile preprocessFileLineNumbers "client\functions\playerSpawn.sqf";
playerSetup = compile preprocessFileLineNumbers "client\functions\playerSetup.sqf";
spawnAction = compile preprocessFileLineNumbers "client\functions\spawnAction.sqf";
placeSpawnBeacon = compile preprocessFileLineNumbers "client\systems\playerMenu\placeSpawnBeacon.sqf";
refuelVehicle = compile preprocessFileLineNumbers "client\systems\playerMenu\refuel.sqf";
repairVehicle = compile preprocessFile "client\systems\playerMenu\repair.sqf";
placeCamoNet = compile preprocessFileLineNumbers "client\systems\playerMenu\placeCamoNet.sqf";
useMedicalKit = compile preprocessFileLineNumbers "client\systems\playerMenu\useMedicalKit.sqf";
togglePlayerNames = compile preprocessFileLineNumbers "client\systems\playerMenu\togglePlayerNames.sqf";
toggleEarplugs = compile preprocessFileLineNumbers "client\systems\playerMenu\toggleEarplugs.sqf";
flipVehicle = compile preprocessFileLineNumbers "client\systems\playerMenu\flipVehicle.sqf";
toggleVehicleLock = compile preprocessFileLineNumbers "client\functions\toggleVehicleLock.sqf";

// Sync client with server time
timeSync = compile preprocessFileLineNumbers "client\functions\clientTimeSync.sqf";

if(!isServer) then {
	craterCleanupManager = compile preprocessFileLineNumbers "client\functions\craterCleanupManager.sqf";
};

// Update Scripts
updateSpawnBeaconMarkers = compile preprocessFileLineNumbers "client\functions\updateSpawnBeaconMarkers.sqf";
spawnBeaconMonitor = compile preprocessFileLineNumbers "client\functions\spawnBeaconMonitor.sqf";
cleanBeaconArrays = compile preprocessFileLineNumbers "client\functions\cleanBeaconArrays.sqf";
updateMissionsMarkers = compile preprocessFileLineNumbers "client\functions\updatePlayerMissionMarkers.sqf";
updateTeamKiller = compile preprocessFileLineNumbers "client\functions\updateTeamKiller.sqf";

// Team-Kill System
teamkillAction = compile preprocessFileLineNumbers "client\functions\doTeamKillAction.sqf";
showTeamkillMessage = compile preprocessFileLineNumbers "client\functions\showTeamKillMessage.sqf";

// Markers
createMarkers = compile preprocessFileLineNumbers "client\functions\createMarkers.sqf";

// General & Gun Store Dialog
client_respawnDialog = compile preprocessFileLineNumbers "client\functions\loadRespawnDialog.sqf";
loadGeneralStore = compile preprocessFileLineNumbers "client\systems\generalStore\loadGenStore.sqf";
loadGunStore = compile preprocessFileLineNumbers "client\systems\gunStore\loadGunStore.sqf";
loadSellConfirm = compile preprocessFileLineNumbers "client\systems\gunStore\loadSellConfirm.sqf";
sellWeaponConfirmed = compile preprocessFileLineNumbers "client\systems\gunStore\sellWeaponConfirmed.sqf";

// Helicopter Store Dialog
loadHelicopterStore = compile preprocessFileLineNumbers "client\systems\helicopterStore\loadHelicopterStore.sqf";
populateHelicopterStore = compile preprocessFileLineNumbers "client\systems\helicopterStore\populateHelicopterStore.sqf";
helicopterItemInfo = compile preprocessFileLineNumbers "client\systems\helicopterStore\itemInfo.sqf";

// Building Store Dialog
loadBuildingStore = compile preprocessFileLineNumbers "client\systems\buildingStore\loadBuildingStore.sqf";
populateBuildingStore = compile preprocessFileLineNumbers "client\systems\buildingStore\populateBuildingStore.sqf";
buildingItemInfo = compile preprocessFileLineNumbers "client\systems\buildingStore\itemInfo.sqf";

// Bicycle Spawn Script
spawnBicycle = compile preprocessFileLineNumbers "client\systems\playerMenu\spawnBicycle.sqf";
removeParachute = compile preprocessFileLineNumbers "client\functions\removeParachute.sqf";

// Utility Scripts
closestTown = compile preprocessFile "client\functions\closestTown.sqf";
azimuthToBearing = compile preprocessFile "client\functions\azimuthToBearing.sqf";
spawnInfoText = compile preprocessFileLineNumbers "client\functions\spawnInfoText.sqf";

player groupChat "Client Compile Complete";
