//	@file Version: 1.0
//	@file Name: repair.sqf
//  @file Author: [404] Costlyy
//	@file Created: 29/01/2013 00:00
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_currVehicle", "_iteration", "_loopSpeed", "_iterationAmount", "_iterationPercentage"];

_currVehicle = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 10] select 0;

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

if(isNil{_currVehicle}) exitWith {
	hint "No vehicle within range.";
};

if(((damage _currVehicle) > 0.05) || !(canMove _currVehicle) || (_currVehicle isKindOf "Air") || ((count crew _currVehicle > 0) && (count(configFile >> "CfgVehicles" >> (typeOf _currVehicle) >> "Turrets") > 0) && !(canFire _currVehicle))) then {

	mutexScriptInProgress = true;
	_currPlayerState = animationState player;
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
    		player switchMove _currPlayerState;

		};

   		if(!(alive player)) exitWith {
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

		if(player distance _currVehicle > 10) exitWith {
			2 cutText ["Vehicle repair interrupted...", "PLAIN DOWN", 1];
		};

		if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
			player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		};

		_iterationAmount = _iterationAmount - 1;
		_iterationPercentage = floor (_iteration / _totalDuration * 100);

		2 cutText [format["Vehicle repair %1%2 complete", _iterationPercentage, "%"], "PLAIN DOWN", 1];
		sleep 1;

		if(_iteration >= _totalDuration) exitWith {
			sleep 1;

			2 cutText ["", "PLAIN DOWN", 1];

			player switchMove _currPlayerState;
  			player setVariable["repairkits", (player getVariable "repairkits") - 1, false];

      			_currVehicle setDamage 0;
   		};
	};
}
else {
	{
		[_currVehicle, _x, 0] call client_setHit;
	} forEach ["HitGlass1", "HitGlass2", "HitGlass3", "HitGlass4", "HitGlass5", "HitGlass6"];

	hint "Vehicle does not need repairing";
};

sleep 1;

2 cutText ["", "PLAIN DOWN", 1];
mutexScriptInProgress = false;
