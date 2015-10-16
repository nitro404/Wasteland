//	@file Version: 1.0
//	@file Name: cleanupObject.sqf
//	@file Author: nitro glycerine
//	@file Created: 15/10/2015 10:19 PM
//	@file Args: [object, lifespan] call cleanupObject;
//	@file Args: [object, lifespan, minValue] call cleanupObject; // for money

private["_object", "_lifespan", "_minimumValue", "_value", "_currentTime", "_creationTime"];

_object = _this select 0;
_lifespan = _this select 1;
_minimumValue = _this select 2;

if(!isNil "_minimumValue") then {
	if(_object isKindOf "Evmoney") then {
		if(typeName _minimumValue == "SCALAR") then {
			_value = _object getVariable "money";

			if(!isNil "_value") then {
				if(typeName _value == "SCALAR") then {
					if(_value >= _minimumValue) exitWith {
						false
					};
				};
			};
		};
	};
};

_networkObject = false;

if(_object isKindOf "CraterLong") then {
	_networkObject = true;
};

_currentTime = time;
_creationTime = _object getVariable "creationTime";

if(isNil "_creationTime") exitWith {
	_object setVariable["creationTime", _currentTime, _networkObject];

	false
};

if(typeName _creationTime != "SCALAR") exitWith {
	_object setVariable["creationTime", _currentTime, _networkObject];

	false
};

if(_currentTime - _creationTime > _lifespan) then {
	if(_object isKindOf "Man") then {
		detach _object;
	};

	deleteVehicle _object;

	if(true) exitWith { true };
};

false
