//@file Version: 1.0
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [404] Costlyy
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if(isDedicated) exitWith { };

// Disable player from killing in the spawn area.
player enableSimulation false;
removeAllWeapons player;

// Start the loading screen ASAP.
titleText ["Loading...", "BLACK OUT", 0];

mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
currentMissionMarkers = [];
currentSpawnBeaconMarkers = [];

playerSetupComplete = false;

waitUntil { !isNull player };
waitUntil { time > 2 };

//Call client compile list.
player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

//Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

player call playerSetup;

if(!isNil "client_initEH") then { player removeEventHandler["Respawn", client_initEH]; };
player addEventHandler ["Respawn", { [_this] call onRespawn; } ];
player addEventHandler ["Killed", { [_this] call onKilled; } ];
player addMPEventHandler ["MPKilled", { [_this] call onMultiplayerKilled; } ];

[] execVM "client\clientEvents\onMouseWheel.sqf";

waitUntil { !(isNull (findDisplay 46)) };
(findDisplay 46) displaySetEventHandler["KeyDown", "_this call onKeyPress"];

"currentDate" addPublicVariableEventHandler { [] call timeSync; };
"clientMissionMarkers" addPublicVariableEventHandler { [] call updateMissionsMarkers; };
"pvar_beaconListBlu" addPublicVariableEventHandler { [] call updateSpawnBeaconMarkers; };
"pvar_beaconListRed" addPublicVariableEventHandler { [] call updateSpawnBeaconMarkers; };
"pvar_beaconListIndep" addPublicVariableEventHandler { [] call updateSpawnBeaconMarkers; };
"pvar_teamKillList" addPublicVariableEventHandler { [] call updateTeamKiller; };
"publicVar_teamkillMessage" addPublicVariableEventHandler { if(local(_this select 1)) then { [] spawn teamkillMessage; }; };

[] execVM "client\systems\hud\playerHud.sqf";

sleep 0.1;

[] execVM "client\functions\createTownMarkers.sqf";
[] execVM "client\functions\createGunStoreMarkers.sqf";
[] execVM "client\functions\createGeneralStoreMarkers.sqf";
[] execVM "client\functions\createHelicopterStoreMarkers.sqf";
[] execVM "client\functions\createBuildingStoreMarkers.sqf";

//true execVM "client\functions\loadAtmosphere.sqf"; // Set to false to disable dust, ash and wind

if(!isServer) then {
    [] spawn craterCleanupManager;
};

[] call updateMissionsMarkers;
[] spawn spawnBeaconMonitor;

if(isNil "FZF_IC_INIT") then {
	call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};

sleep 1;

true spawn playerSpawn;

[] execVM "client\functions\antiCheatClient.sqf";
[] spawn FZF_IC_INIT;
