//	@file Version: 1.0
//	@file Name: cleanupVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 16/10/2015 10:19 AM
//	@file Args: [vehicle] call cleanupVehicle;

private["_vehicle", "_missionVehicle", "_playerNearVehicle", "_currentTime", "_creationTime", "_lastTime", "_exitTime", "_immobileTime", "_activityTime", "_result", "_isBicycle"];

_vehicle = _this select 0;
_missionVehicle = _vehicle getVariable["missionVehicle", false];
_currentTime = time;
_lastTime = nil;
_result = nil;
_lifeSpan = 600;

if(isNil { _missionVehicle }) then {
	_missionVehicle = false;
};

if(_missionVehicle) exitWith { false };

if(!(alive _vehicle)) exitWith { false };

if(typeOf _vehicle in specialVehicles) exitWith { false };

if(count crew _vehicle > 0) exitWith { false };

_isBicycle = _vehicle isKindof "Bicycle";

if(_isBicycle) then {
	_lifeSpan = 300;
};

_immobileTime = _vehicle getVariable "immobileTime";

if(canMove _vehicle) then {
	if(!isNil { _immobileTime }) then {
		_vehicle setVariable["immobileTime", nil, false];
	};
}
else {
	if(isNil { _immobileTime }) exitWith {
		_vehicle setVariable["immobileTime", _currentTime, false];

		_result = false;
	};

	if(_currentTime - _immobileTime > _lifeSpan) exitWith {
		deleteVehicle _vehicle;

		_result = true;
	};
};

if(!isNil { _result }) exitWith { _result };

if(_isBicycle) then {
	_creationTime = _vehicle getVariable "creationTime";

	if(!(isNil { _creationTime })) then {
		if(typeName _creationTime == "SCALAR") then {
			_lastTime = _creationTime;
		};
	};
};

_exitTime = _vehicle getVariable "exitTime";

if(_isBicycle) then {
	if(!(isNil { _exitTime })) then {
		if(typeName _exitTime == "SCALAR") then {
			if(_exitTime > _lastTime) then {
				_lastTime = _exitTime;
			};
		};
	};
}
else {
	if(isNil { _exitTime }) exitWith { _result = false; };

	if(typeName _exitTime != "SCALAR") exitWith { _result = false; };
};

if(!isNil { _result }) exitWith { _result };

_playerNearVehicle = false;

{
	if(_x distance _vehicle <= 150) exitWith {
		_playerNearVehicle = true;
	};
} forEach playableUnits;

if(_playerNearVehicle) exitWith {
	_vehicle setVariable["activityTime", _currentTime, false];

	false
};

if(isNil { _lastTime }) then {
	_lastTime = _exitTime;
};

_activityTime = _vehicle getVariable "activityTime";

if(!(isNil { _activityTime })) then {
	if(typeName _activityTime == "SCALAR") then {
		if(_activityTime > _lastTime) then {
			_lastTime = _activityTime;
		};
	};
};

if(_currentTime - _lastTime > _lifeSpan) exitWith {
	deleteVehicle _vehicle;

	true
};

false
