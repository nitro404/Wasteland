//	@file Version: 1.0
//	@file Name: repair.sqf
//  	@file Author: [404] Costlyy
//	@file Created: 29/01/2013 00:00

if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_currVehicle", "_fuelAmount", "_iteration", "_loopSpeed", "_iterationAmount", "_iterationPercentage"];

_currVehicle = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 10] select 0;

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

if(isNil {_currVehicle}) exitWith {
	hint "No vehicle within range.";
};

if(_currVehicle isKindOf "Bicycle") exitWith {
	hint "Can't refuel bicycles!";
};

if((fuel _currVehicle) >= 0.99) exitWith {
	hint "Vehicle is already fully fueled!";
};

_fuelAmount = 0.5;

if(_currVehicle isKindOf "Air") then {
	_fuelAmount = 0.75;
};

if(_currVehicle isKindOf "Tank") then {
	_fuelAmount = 0.25;
};

if(_currVehicle isKindOf "Motorcycle") then {
	_fuelAmount = 0.75;
};

if(_currVehicle isKindOf "ATV_Base_EP1") then {
	_fuelAmount = 0.75;
};

mutexScriptInProgress = true;
_currPlayerState = animationState player;
player switchMove "AinvPknlMstpSlayWrflDnon_medic";

_totalDuration = 5;
_iterationAmount = _totalDuration;
_iteration = 0;

for "_iteration" from 1 to _iterationAmount do {
	if(vehicle player != player) exitWith {
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
	};

	if(doCancelAction) exitWith {
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
			player switchMove _currPlayerState;
		doCancelAction = false;
		mutexScriptInProgress = false;
	};

	if(!(alive player)) exitWith {
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
	};

	if(player distance _currVehicle > 10) exitWith {
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
	};

	if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};

	_iterationAmount = _iterationAmount - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);

	2 cutText [format["Refuelling Vehicle (%1%2)", _iterationPercentage, "%"], "PLAIN DOWN", 1];

	sleep 1;

	if(_iteration >= _totalDuration) exitWith {
		sleep 1;

		2 cutText ["", "PLAIN DOWN", 1];
		player switchMove _currPlayerState;

		player setVariable["fuelFull", 0, true];
		player setVariable["fuelEmpty", 1, true];

		if(!(local _currVehicle)) then {
			[nil, _currVehicle, "loc", rSPAWN, [_currVehicle, _fuelAmount], {(_this select 0) setFuel (fuel(_this select 0) + (_this select 1))}] call RE;
		}
		else {
			_currVehicle setFuel ((fuel _currVehicle) + _fuelAmount);
		};
	};
};

mutexScriptInProgress = false;
