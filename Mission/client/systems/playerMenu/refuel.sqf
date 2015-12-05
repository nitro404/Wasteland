//	@file Version: 1.0
//	@file Name: repair.sqf
//  	@file Author: [404] Costlyy
//	@file Created: 29/01/2013 00:00

if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_vehicle", "_vehicleType", "_fuelAmount", "_playerState", "_iteration", "_loopSpeed", "_iterationAmount", "_iterationPercentage"];

_vehicle = player nearEntities[["LandVehicle", "Air", "Ship"], 10] select 0;

if(isNil {_vehicle}) exitWith {
	player globalChat "No vehicle within range.";
};

_vehicleType = typeOf _vehicle;

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

if(_vehicle isKindOf "Bicycle") exitWith {
	player globalChat "Can't refuel bicycles!";
};

if((fuel _vehicle) >= 0.99) exitWith {
	player globalChat "Vehicle is already fully fueled!";
};

_fuelAmount = 0.5;

if( _vehicle isKindOf "Motorcycle" || _vehicle isKindOf "ATV_Base_EP1" || _vehicle isKindOf "Air") then {
	_fuelAmount = 0.75;
};

if(_vehicle isKindOf "Tank") then {
	_fuelAmount = 0.25;
};

mutexScriptInProgress = true;
_playerState = animationState player;
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
			player switchMove _playerState;
		doCancelAction = false;
		mutexScriptInProgress = false;
	};

	if(!(alive player)) exitWith {
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
	};

	if(player distance _vehicle > 10) exitWith {
		2 cutText ["Vehicle refuel interrupted...", "PLAIN DOWN", 1];
	};

	if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};

	_iterationAmount = _iterationAmount - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);

	2 cutText [format["Refuelling %1 (%2%3)", _vehicleType, _iterationPercentage, "%"], "PLAIN DOWN", 1];

	sleep 1;

	if(_iteration >= _totalDuration) exitWith {
		sleep 1;

		2 cutText ["", "PLAIN DOWN", 1];
		player switchMove _playerState;

		player setVariable["fuelFull", 0, true];
		player setVariable["fuelEmpty", 1, true];

		if(!(local _vehicle)) then {
			[nil, _vehicle, "loc", rSPAWN, [_vehicle, _fuelAmount], {(_this select 0) setFuel (fuel(_this select 0) + (_this select 1))}] call RE;
		}
		else {
			_vehicle setFuel ((fuel _vehicle) + _fuelAmount);
		};
	};
};

mutexScriptInProgress = false;
