//	@file Version: 1.0
//	@file Name: onNPCKilled.sqf
//	@file Author: nitro glycerine
//	@file Created: 18/10/2015 5:39 PM
//	@file Args: [[unit, killer]] spawn onNPCKilled;

if(count _this < 1) exitWith {
	diag_log format["onNPCKilled Expected at least 1 argument, received %1.", count _this];
};

_args = _this select 0;

if(count _args < 2) exitWith {
	diag_log format["onNPCKilled argument array expected to have at least 2 values, received %1.", count _args];
};

_unit = _args select 0;
_killer = _args select 1;
_actualKiller = _killer;

if(_unit == _killer) then {
	_vehiclesNear = nearestObjects [_unit, ["Motorcycle", "Car", "Truck", "Tank"], 10];

	if(count _vehiclesNear > 0) then {
		_vehicle = _vehiclesNear select 0;
		_driver = driver _vehicle;

		if(speed _vehicle > 0 && !isNull _driver && { isPlayer _driver }) then {
			_actualKiller = _driver;
		};
	};
};

if(_unit == _actualKiller) exitWith { };

if(getPlayerUID player != getPlayerUID _actualKiller) exitWith { };

_reward = 100;
_money = player getVariable "money";

if(isNil { _money }) then {
	_money = 0;
};

if(typeName _money != "SCALAR") then {
	_money = 0;
};

player setVariable["money", _money + _reward, true];

player globalChat format["You received $%1 for killing %2 NPC!", _reward, typeOf _unit];
