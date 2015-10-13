//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

#include "setup.sqf"

if(!isServer) exitWith { };

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

diag_log format["WASTELAND SERVER - Server Compile Finished"];

diag_log format["WASTELAND SERVER - Spawning Initial Objects in Towns"];

_spawnInitialObjects = [] execVM "server\functions\spawnInitialObjects.sqf";

waitUntil {
    sleep 0.5;
    scriptDone _spawnInitialObjects
};

diag_log format["WASTELAND SERVER - Starting Vehicle Respawn Scripts"];

[] spawn respawnVehicles;
[] spawn respawnHelicopters;

diag_log format["WASTELAND SERVER - Initializing Mission Controllers"];

{
    [missionTypes select _forEachIndex] spawn missionController;
} forEach missionTypes;

if(isDedicated) then {
	_id = [] execFSM "server\WastelandServClean.fsm";
};
