//@file Version: 1.0
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [404] Costlyy
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if(isDedicated) exitWith { };

player enableSimulation false;
removeAllWeapons player;

titleText ["Loading...", "BLACK OUT", 0];

mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
playerTeamKiller = objNull;
doCancelAction = false;
currentSpawnBeaconMarkers = [];

playerSetupComplete = false;

waitUntil { !isNull player };
waitUntil { time > 2 };

player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

execVM "briefing.sqf";

_makeBuildingsIndestructible = execVM "shared\makeBuildingsIndestructible.sqf";

waitUntil {
	sleep 0.1;
	scriptDone _makeBuildingsIndestructible
};

call playerSetup;

if(!isNil "onFirstSpawn") then {
	player removeEventHandler["Respawn", onFirstSpawn];
	onFirstSpawn = nil;
};

player addEventHandler ["Respawn", { _this call onRespawn; } ];
player addEventHandler ["Killed", { _this call onKilled; } ];
player addMPEventHandler ["MPKilled", { _this call onMultiplayerKilled; } ];

execVM "client\clientEvents\onMouseWheel.sqf";

waitUntil { !(isNull (findDisplay 46)) };
(findDisplay 46) displaySetEventHandler["KeyDown", "_this call onKeyPress"];
(findDisplay 46) displaySetEventHandler["KeyUp", "_this call onKeyRelease"];

"currentDate" addPublicVariableEventHandler { call timeSync; };
"spawnBeaconsBluFor" addPublicVariableEventHandler { call updateSpawnBeaconMarkers; };
"spawnBeaconsOpFor" addPublicVariableEventHandler { call updateSpawnBeaconMarkers; };
"spawnBeaconsIndependent" addPublicVariableEventHandler { call updateSpawnBeaconMarkers; };
"teamKillList" addPublicVariableEventHandler { call updateTeamKiller; };
"teamkillMessage" addPublicVariableEventHandler { if(local(_this select 1)) then { [] spawn showTeamkillMessage; }; };

execVM "client\systems\hud\playerHud.sqf";

sleep 0.1;

execVM "client\functions\createTownMarkers.sqf";
execVM "client\functions\createGunStoreMarkers.sqf";
execVM "client\functions\createGeneralStoreMarkers.sqf";
execVM "client\functions\createHelicopterStoreMarkers.sqf";
execVM "client\functions\createBuildingStoreMarkers.sqf";

//true execVM "client\functions\loadAtmosphere.sqf"; // Set to false to disable dust, ash and wind

if(!isServer) then {
	[] spawn craterCleanupManager;
};

[] spawn spawnBeaconMonitor;

if(isNil "FZF_IC_INIT") then {
	call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};

sleep 1;

true spawn playerSpawn;

execVM "client\functions\antiCheatClient.sqf";
[] spawn FZF_IC_INIT;
