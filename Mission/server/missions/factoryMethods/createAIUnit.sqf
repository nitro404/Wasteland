//	@file Version: 1.0
//	@file Name: createAIUnit.sqf
//	@file Author: nitro glycerine
//	@file Created: 07/11/2015 11:54 PM
//	@file Args: [group, position, unitClass, unitType] call createAIUnit;
//	Unit Types: 1: Rifleman
//		    2: Machine Gunner
//		    3: Sniper
//		    4: Anti-Tank
//		    5: Anti-Air

private["_aiGroup", "_position", "_unitClass", "_unitType", "_unit"];

if(!isServer) exitWith { };

if(count _this < 3) exitWith { };

_aiGroup = _this select 0;
_position = _this select 1;
_unitClass = _this select 2;
_unitType = _this select 3;

_unit = _aiGroup createUnit[_unitClass, _position, [], 0.5, "Form"];

removeAllWeapons _unit;
removeBackpack _unit;

_unit removeWeapon "ItemRadio";
_unit removeWeapon "Binocular";

[_unit, _unitType] call randomAIWeapons;

_unit
