//	@file Version: 1.0
//	@file Name: onMultiplayerKilled.sqf
//	@file Author: nitro glycerine
//	@file Created: 18/10/2015 8:34 PM
//	@file Args: [[unit, killer]] spawn onMultiplayerKilled;

if(count _this < 1) exitWith { };

_args = _this select 0;

if(count _args < 2) exitWith { };

_victim = _args select 0;
_victimSide = side group _victim;
_killer = _args select 1;
_actualKiller = _killer;
_roadKill = false;

if(_victim == _killer) then {
	_vehiclesNear = nearestObjects [_victim, ["LandVehicle"], 20];

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

_killerSide = side group _actualKiller;

_teamKill = _killerSide != resistance && _killerSide == _victimSide;

_victimInGroup = false;

if(_killerSide == resistance && _victimSide == resistance) then {
	{
		if(_victim == _x) then {
			_victimInGroup = true;
		};
	} forEach units group _actualKiller;
};

if(isServer) then {
	if(isPlayer _actualKiller) then {
		if(_teamKill) then {
			if(_roadKill) then {
				_actualKiller addScore -1;
			};
		}
		else {
			if(_roadKill) then {
				if(_victimInGroup) then {
					_actualKiller addScore -1;
				}
				else {
					_actualKiller addScore 1;
				};
			}
			else {
				if(_killerSide == resistance && _victimSide == resistance && !_victimInGroup) then {
					_actualKiller addScore 2;
				};
			};
		};
	};
};

if(_teamKill) exitWith { };

if(_victimInGroup) exitWith { };

if(getPlayerUID player != getPlayerUID _actualKiller) exitWith { };

_money = player getVariable "money";

if(isNil { _money }) then {
	_money = 0;
};

if(typeName _money != "SCALAR") then {
	_money = 0;
};

_killerBounty = player getVariable "bounty";

if(isNil { _killerBounty }) then {
	_killerBounty = 0;
};

if(typeName _killerBounty != "SCALAR") then {
	_killerBounty = 0;
};

_victimBounty = _victim getVariable "bounty";

if(isNil { _victimBounty }) then {
	_victimBounty = 0;
};

if(typeName _victimBounty != "SCALAR") then {
	_victimBounty = 0;
};

_reward = _victimBounty + 100;

_victim setVariable["bounty", 0, true];

player setVariable["money", _money + _reward, true];
player setVariable["bounty", _killerBounty + 100, true];

player globalChat format["You received $%1 for killing %2!", _reward, name _victim];
