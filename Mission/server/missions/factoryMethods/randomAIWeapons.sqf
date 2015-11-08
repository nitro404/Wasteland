//	@file Version: 1.0
//	@file Name: randomAIWeapons.sqf
//	@file Author: nitro glycerine
//	@file Created: 03/11/2015 6:29 PM
//	@file Args: [unit, unitType] call randomAIWeapons;
//	Unit Types: 1: Rifleman
//		    2: Machine Gunner
//		    3: Sniper
//		    4: Anti-Tank
//		    5: Anti-Air

private["_unit", "_unitType", "_weaponList"];

if(!isServer) exitWith { };

if(count _this < 1) exitWith { };

_unit = _this select 0;
_unitType = _this select 1;
_weaponList = nil;

if(isNil { _unitType }) then {
	_unitType = floor(random 5) + 1;
};

if(typeName _unitType != "SCALAR") then {
	_unitType = floor(random 5) + 1;
};

if(_unitType < 0 || _unitType > 4) then {
	_unitType = floor(random 5) + 1;
};

if(_unitType <= 3) then {
	_weaponList = (randomWeapons select _unitType + 1) select 2;
}
else {
	_weaponList = (randomWeapons select 2) select 2;
};

[_unit, _weaponList] call randomAIWeapon;
[_unit, (randomWeapons select 0) select 2] call randomAIWeapon;

if(_unitType >= 4) then {
	[_unit, (randomWeapons select _unitType + 1) select 2] call randomAIWeapon;
};
