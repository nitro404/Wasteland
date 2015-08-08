//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

#include "setup.sqf"

if(!X_Server) exitWith { };

sideMissions = 1;
serverSpawning = 1;

[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
_serverCompiledScripts = [] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";
[] execVM "server\functions\serverTimeSync.sqf";
[] execVM "server\functions\antiCheatServer.sqf";
waitUntil{scriptDone _serverCompiledScripts};

diag_log format["WASTELAND SERVER - Server Compile Finished"];

#ifdef __DEBUG__
#else
if (serverSpawning == 1) then {
    diag_log format["WASTELAND SERVER - Initializing Server Spawning"];

	_vehSpawn = [] ExecVM "server\functions\vehicleSpawning.sqf";
	waitUntil { sleep 0.1; scriptDone _vehSpawn };

    _objSpawn = [] ExecVM "server\functions\objectsSpawning.sqf";
	waitUntil { sleep 0.1; scriptDone _objSpawn };

    _gunSpawn = [] ExecVM "server\functions\staticGunSpawning.sqf";
	waitUntil { sleep 0.1; scriptDone _gunSpawn };

    _heliSpawn = [] ExecVM "server\functions\staticHeliSpawning.sqf";
    waitUntil { sleep 0.1; scriptDone _heliSpawn };

    _heliSpawn = [] ExecVM "server\functions\staticHeliSpawning.sqf";
    waitUntil { sleep 0.1; scriptDone _heliSpawn };

    _weaponCrateSpawning = [] ExecVM "server\functions\boxSpawning.sqf";
    waitUntil{ sleep 0.1; scriptDone _weaponCrateSpawning };

    _markerClean = [] ExecVM "server\functions\cleanMarkers.sqf";
    waitUntil { sleep 0.1; scriptDone _markerClean };
};
#endif

if(sideMissions == 1) then {
	diag_log format["WASTELAND SERVER - Initializing Missions"];

    [] execVM "server\missions\sideMissionController.sqf";

    sleep 5;

    [] execVM "server\missions\mainMissionController.sqf";
};

if(isDedicated) then {
	_id = [] execFSM "server\WastelandServClean.fsm";
};
