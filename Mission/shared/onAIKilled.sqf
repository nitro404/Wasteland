//	@file Version: 1.0
//	@file Name: onAIKilled.sqf
//	@file Author: nitro glycerine
//	@file Created: 18/10/2015 5:39 PM
//	@file Args: [unit, killer] spawn onAIKilled;

if(count _this < 2) exitWith { };

_victim = _this select 0;
_killer = _this select 1;
_actualKiller = _killer;
_roadKill = false;

if(_victim == _killer) then {
	_vehiclesNear = _victim nearEntities ["LandVehicle", 20];

	if(count _vehiclesNear > 0) then {
		_vehicle = _vehiclesNear select 0;
		_driver = driver _vehicle;

		if(speed _vehicle > 0 && !isNull _driver && { isPlayer _driver }) then {
			_actualKiller = _driver;
			_roadKill = true;
		};
	};
};

if(_victim == _actualKiller) exitWith { };

if(isServer) then {
	if(isPlayer _actualKiller) then {
		if(_roadKill) then {
			_actualKiller addScore 1;
		}
		else {
			_actualKiller addScore 2;
		};
	};
};

if(getPlayerUID player != getPlayerUID _actualKiller) exitWith { };

_reward = 100;
_money = player getVariable "money";

if(isNil { _money }) then {
	_money = 0;
};

if(typeName _money != "SCALAR") then {
	_money = 0;
};

_bounty = player getVariable "bounty";

if(isNil { _bounty }) then {
	_bounty = 0;
};

if(typeName _bounty != "SCALAR") then {
	_bounty = 0;
};

player setVariable["money", _money + _reward, true];
player setVariable["bounty", _bounty + 50, true];

player globalChat format["You received $%1.", _reward];
