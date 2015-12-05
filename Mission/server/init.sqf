//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

#include "setup.sqf"

if(!isServer) exitWith { };

private["_serverCompiledScripts", "_numberOfControllers", "_spawnInitialObjects"];

[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
_serverCompiledScripts = [] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";
[] execVM "server\functions\serverTimeSync.sqf";
[] execVM "server\functions\antiCheatServer.sqf";

waitUntil {
	sleep 0.1;
	scriptDone _serverCompiledScripts
};

diag_log format["Server Compile Finished!"];

_makeBuildingsIndestructible = [] execVM "shared\makeBuildingsIndestructible.sqf";

waitUntil {
	sleep 0.1;
	scriptDone _makeBuildingsIndestructible
};

diag_log format["Initializing Mission Controllers..."];

{
	_numberOfControllers = (missionTypes select _forEachIndex) select 0;

	for "_controllerIndex" from 1 to _numberOfControllers do {
		[missionTypes select _forEachIndex] spawn missionController;
	};
} forEach missionTypes;

if(isDedicated) then {
	diag_log format["Starting Cleanup Managers..."];

	[] spawn objectCleanupManager;
	[] spawn vehicleCleanupManager;
};

diag_log format["Spawning Initial Objects in Towns..."];

_spawnInitialObjects = [] execVM "server\functions\spawnInitialObjects.sqf";

waitUntil {
	sleep 0.5;
	scriptDone _spawnInitialObjects
};

diag_log format["Starting Vehicle Respawn Scripts..."];

[] spawn respawnVehicles;
[] spawn respawnBoats;
[] spawn respawnHelicopters;

