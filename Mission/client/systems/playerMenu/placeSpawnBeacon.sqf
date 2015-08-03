
//	@file Version: 1.0
//	@file Name: pickupBecon.sqf
//	@file Author: [404] Costlyy
//	@file Created: 7/12/2012 23:30
//	@file Args:

// PRECONDITION: Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_stringEscapePercent","_totalDuration","_lockDuration","_iteration","_iterationPercentage","_playerPos","_placedBeacon", "_lockDuration", "_beaconOwner", "_placedBeaconPos", "_playerSide", "_playerUID", "_activeBeacon"];

// PRECONDITION: Check that a player is not currently a car (driving)
if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

_stringEscapePercent = "%"; // Required to get the % sign into a formatted string.
_totalDuration = 30; // This will NOT be easy >:)
_lockDuration = _totalDuration;
_iteration = 0;
_beaconOwner = name vehicle player;
_playerSide = str(playerSide);
_playerUID = getPlayerUID player;
_activeBeacon = false;
_playerDir = getDir player;

// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (BLU).
{
	if(str(_playerUID) == str(_x select 3)) then {
    		_activeBeacon = true;
	};
}	forEach pvar_beaconListBlu;

// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (RED).
{
	if(str(_playerUID) == str(_x select 3)) then {
		_activeBeacon = true;
	};
} forEach pvar_beaconListRed;

// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (Indep).
{
	if(str(_playerUID) == str(_x select 3)) then {
		_activeBeacon = true;
	};
} forEach pvar_beaconListIndep;

// Remove active beacon so you can deploy new
if(_activeBeacon) then {
	hint "Deactivating existing active spawn beacon.";
	[_playerUID] execVM "client\functions\cleanBeaconArrays.sqf";
};

player switchMove "AinvPknlMstpSlayWrflDnon_medic"; // Begin the full medic animation...

mutexScriptInProgress = true;

for "_iteration" from 1 to _lockDuration do {
	if(vehicle player != player) exitWith {
		player globalChat localize "STR_WL_Errors_BeaconInVehicle";
		player action ["eject", vehicle player];
		mutexScriptInProgress = false;
	};

	// Player selected "cancel action".
	if (doCancelAction) exitWith {
		2 cutText ["", "PLAIN DOWN", 1];
		doCancelAction = false;
		mutexScriptInProgress = false;
	};

	// If the player dies, revert state.
	if(!(alive player)) exitWith {
		2 cutText ["Spawn beacon placement interrupted...", "PLAIN DOWN", 1];
		mutexScriptInProgress = false;
	};

	if(!isNil "_currObject") then {
		if(player distance _currObject > 5) exitWith { // If the player dies, revert state.
			2 cutText ["Spawn beacon placement interrupted...", "PLAIN DOWN", 1];
			mutexScriptInProgress = false;
		};
	};

 	// Keep the player locked in medic animation for the full duration of the placement.
	if(animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};

	_lockDuration = _lockDuration - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);

	2 cutText [format["Placing Spawn Beacon (%1%2)", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
	sleep 1;

	// Sleep a little extra to show that place has completed.
	if(_iteration >= _totalDuration) exitWith {
		sleep 1;
		2 cutText ["", "PLAIN DOWN", 1];

		player setVariable["spawnBeacon", 0, true];

		_playerPos = getPosATL player;
		_placedBeacon = "Satelit" createVehicle (position player);
		_placedBeacon setPos _playerPos;
		_placedBeacon setDir _playerDir  - 180;
		_placedBeacon addEventHandler["handleDamage", {false}];
		_placedBeacon setVariable["R3F_LOG_disabled", true];
		_placedBeacon setVariable["faction", _playerSide, true];
		_placedBeacon setVariable["ownerName", _beaconOwner, true];
		_placedBeacon setVariable["ownerUID", _playerUID, true];

		// Disable physics for the spawn beacon globally and JIP
		_announce = [nil, _placedBeacon, "per", rENABLESIMULATION, false] call RE;

		_placedBeaconPos = getPos _placedBeacon;
		_nearestTown = [_placedBeaconPos] call compile preprocessFile "client\functions\nearestTown.sqf";
		_directionToTown = [_nearestTown select 0, _placedBeaconPos] call BIS_fnc_dirTo;
		_directionToTownStr = [_directionToTown, false] call compile preprocessFile "client\functions\azimuthToBearing.sqf";
		_goingDirStr = [_playerDir, false] call compile preprocessFile "client\functions\azimuthToBearing.sqf";
		_relativePosition = format['%1 of %2 facing %3', _directionToTownStr, _nearestTown select 1, _goingDirStr];

		if(_playerSide == "WEST") then {
			pvar_beaconListBlu set [count pvar_beaconListBlu, [_beaconOwner, _placedBeaconPos, 100, _playerUID, _playerDir, _relativePosition, _playerSide]];
			publicVariable "pvar_beaconListBlu";
		};

		if(_playerSide == "EAST") then {
			pvar_beaconListRed set [count pvar_beaconListRed, [_beaconOwner, _placedBeaconPos, 100, _playerUID, _playerDir, _relativePosition, _playerSide]];
			publicVariable "pvar_beaconListRed";
		};

		if(_playerSide == "GUER") then {
			pvar_beaconListIndep set [count pvar_beaconListIndep, [_beaconOwner, _placedBeaconPos, 100, _playerUID, _playerDir, _relativePosition, _playerSide]];
			publicVariable "pvar_beaconListIndep";
		};

		mutexScriptInProgress = false;
	};
};

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.
