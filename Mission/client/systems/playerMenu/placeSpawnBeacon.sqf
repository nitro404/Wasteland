
//	@file Version: 1.0
//	@file Name: pickupBecon.sqf
//	@file Author: [404] Costlyy
//	@file Created: 7/12/2012 23:30

private["_totalDuration", "_lockDuration", "_iteration", "_iterationPercentage", "_playerPos", "_placedBeacon", "_lockDuration", "_beaconOwner", "_placedBeaconPos", "_playerSide", "_playerUID", "_activeBeacon", "_playerDirVector", "_beaconOffset", "_beaconOffsetPos", "_announce", "_beaconData"];

if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

_totalDuration = 30;
_lockDuration = _totalDuration;
_iteration = 0;
_beaconOwner = name vehicle player;
_playerSide = str(playerSide);
_playerUID = getPlayerUID player;
_activeBeacon = false;
_playerDir = getDir player;
_playerDirVector = vectorDir player;

if(getPos player select 0 < 0 ||
   getPos player select 0 > worldDimensions select 0 ||
   getPos player select 1 < 0 ||
   getPos player select 1 > worldDimensions select 1) exitWith {
	player globalChat localize "STR_WL_Errors_BeaconOutOfBounds";
};

if(surfaceIsWater getPos player) exitWith {
	player globalChat localize "STR_WL_Errors_BeaconOverWater";
};

player switchMove "AinvPknlMstpSlayWrflDnon_medic";

mutexScriptInProgress = true;

for "_iteration" from 1 to _lockDuration do {
	if(vehicle player != player) exitWith {
		player globalChat localize "STR_WL_Errors_BeaconInVehicle";
		player action ["eject", vehicle player];
		mutexScriptInProgress = false;
	};

	if (doCancelAction) exitWith {
		2 cutText ["", "PLAIN DOWN", 1];
		doCancelAction = false;
		mutexScriptInProgress = false;
	};

	if(!(alive player)) exitWith {
		2 cutText ["Spawn beacon placement interrupted...", "PLAIN DOWN", 1];
		mutexScriptInProgress = false;
	};

	if(animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};

	_lockDuration = _lockDuration - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);

	2 cutText [format["Placing Spawn Beacon (%1%2)", _iterationPercentage, "%"], "PLAIN DOWN", 1];
	sleep 1;

	if(_iteration >= _totalDuration) exitWith {
		sleep 1;
		2 cutText ["", "PLAIN DOWN", 1];

		player setVariable["spawnBeacon", 0, true];

		_playerPos = getPosATL player;
		_placedBeacon = "Satelit" createVehicle (position player);
		_beaconOffset = [_playerDirVector, 1.75] call BIS_fnc_vectorMultiply;
		_beaconOffsetPos = [_playerPos, _beaconOffset] call BIS_fnc_vectorAdd;
		_placedBeacon setPosATL _beaconOffsetPos;
		_placedBeacon setDir _playerDir - 180;
		_placedBeacon allowDamage false;
		_placedBeacon setVariable["R3F_LOG_disabled", true];
		_placedBeacon setVariable["faction", _playerSide, true];
		_placedBeacon setVariable["ownerName", _beaconOwner, true];
		_placedBeacon setVariable["owner", _playerUID, true];
		_placedBeacon setVariable["creationTime", time, true];

		// Disable physics for the spawn beacon globally and JIP
		_announce = [nil, _placedBeacon, "per", rENABLESIMULATION, false] call RE;

		_placedBeaconPos = getPos _placedBeacon;
		_closestTown = _placedBeaconPos call closestTown;
		_directionToTown = [getMarkerPos (_closestTown select 0), _placedBeaconPos] call BIS_fnc_dirTo;
		_directionToTownStr = [_directionToTown, false] call azimuthToBearing;
		_goingDirStr = [_playerDir, false] call azimuthToBearing;
		_relativePosition = format['%1 of %2 facing %3', _directionToTownStr, _closestTown select 2, _goingDirStr];
		_beaconData = [_beaconOwner, _placedBeaconPos, 100, _playerUID, _playerDir, _relativePosition, _playerSide];

		if([_playerUID, _playerSide] call cleanBeaconArrays) then {
			hint "Deactivating existing active spawn beacon.";
		};

		if(_playerSide == "WEST") then {
			pvar_beaconListBlu set [count pvar_beaconListBlu, _beaconData];
			publicVariable "pvar_beaconListBlu";
		};

		if(_playerSide == "EAST") then {
			pvar_beaconListRed set [count pvar_beaconListRed, _beaconData];
			publicVariable "pvar_beaconListRed";
		};

		if(_playerSide == "GUER") then {
			pvar_beaconListIndep set [count pvar_beaconListIndep, _beaconData];
			publicVariable "pvar_beaconListIndep";
		};

		mutexScriptInProgress = false;
	};
};

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
