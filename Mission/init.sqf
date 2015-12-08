//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: The main init.

if(isnil "RE") then {
	[] execVM "\ca\Modules\MP\data\scripts\MPframework.sqf"
};

enableSaving[false, false];

X_JIP = false;
versionName = "0.0.1";

if(isNull player) then { X_JIP = true; };

true spawn {
	if(!isDedicated) then {
		titleText ["Initializing Player...", "BLACK", 0];
		waitUntil { player == player };
		client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0); }];
	};
};

[] execVM "config.sqf";

enteredVehicle = compile preprocessFileLineNumbers "shared\enteredVehicle.sqf";
exitedVehicle = compile preprocessFileLineNumbers "shared\exitedVehicle.sqf";
onMultiplayerKilled = compile preprocessFileLineNumbers "shared\onMultiplayerKilled.sqf";
onAIKilled = compile preprocessFileLineNumbers "shared\onAIKilled.sqf";
cleanupObject = compile preprocessFileLineNumbers "shared\cleanupObject.sqf";

if(!isDedicated) then {
	waitUntil { player == player };

	if(count units group player > 1) then {
		[player] join grpNull;
	};

	[] execVM "client\init.sqf";
};

if(isServer) then {
	diag_log format ["Starting Mission: %1", missionName];

	diag_log "Initializing Server!";

	[] execVM "server\init.sqf";
};

[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
// [0.1, 0.5, 0.5] execVM "addons\scripts\DynamicWeatherEffects.sqf";
