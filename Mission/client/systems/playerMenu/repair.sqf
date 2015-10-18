//	@file Version: 1.0
//	@file Name: repair.sqf
//	@file Author: [404] Costlyy
//	@file Created: 29/01/2013 00:00
//	@file Args:

if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_vehicle", "_vehicleType", "_playerState", "_iteration", "_totalDuration", "_iterationAmount", "_iterationPercentage"];

_vehicle = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 10] select 0;
_vehicleType = typeOf _vehicle;

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

if(isNil { _vehicle }) exitWith {
	player globalChat "No vehicle within range.";
};

if(((damage _vehicle) > 0.05) || !(canMove _vehicle) || (_vehicle isKindOf "Air") || ((count crew _vehicle > 0) && (count(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Turrets") > 0) && !(canFire _vehicle))) then {
	mutexScriptInProgress = true;

	_playerState = animationState player;
	player switchMove "AinvPknlMstpSlayWrflDnon_medic";

	_totalDuration = 5;
	_iterationAmount = _totalDuration;
	_iteration = 0;

	for "_iteration" from 1 to _iterationAmount do {

        if(vehicle player != player) exitWith {
		2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
	};

        if(doCancelAction) exitWith {
    		2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];

      		doCancelAction = false;
    		player switchMove _playerState;

		};

   		if(!(alive player)) exitWith {
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

		if(player distance _vehicle > 10) exitWith {
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

		if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
			player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		};

		_iterationAmount = _iterationAmount - 1;
		_iterationPercentage = floor (_iteration / _totalDuration * 100);

		2 cutText [format["Repairing %1 (%2%3)", _vehicleType, _iterationPercentage, "%"], "PLAIN DOWN", 1];
		sleep 1;

		if(_iteration >= _totalDuration) exitWith {
			sleep 1;

			2 cutText ["", "PLAIN DOWN", 1];

			player switchMove _playerState;
  			player setVariable["repairkits", (player getVariable "repairkits") - 1, false];

      			_vehicle setDamage 0;
   		};
	};
}
else {
	player globalChat "Vehicle does not need repairing.";
};

sleep 1;

2 cutText ["", "PLAIN DOWN", 1];

mutexScriptInProgress = false;
