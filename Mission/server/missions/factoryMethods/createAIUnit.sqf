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

private["_aiGroup", "_position", "_unitClass", "_unitType", "_unit", "_hasBinoculars"];

if(!isServer) exitWith { };

if(count _this < 3) exitWith { };

_aiGroup = _this select 0;
_position = _this select 1;
_unitType = _this select 2;

_unit = _aiGroup createUnit[aiClasses select (_unitType - 1), _position, [], 0.5, "Form"];
_unit addMPEventHandler["MPKilled", { _this call onAIKilled; } ];

removeAllWeapons _unit;
removeBackpack _unit;

_unit removeWeapon "ItemRadio";
_unit removeWeapon "Binocular";

_hasBinoculars = false;

if(!_hasBinoculars) then {
	if(floor(random 100) < 2) then {
		_unit addWeapon "Laserdesignator";
		_unit addMagazine "Laserbatteries";

		_hasBinoculars = true;
	};
};

if(!_hasBinoculars) then {
	if(floor(random 100) < 50) then {
		_unit addWeapon "Binocular_Vector";

		_hasBinoculars = true;
	};
};

if(!_hasBinoculars) then {
	if(floor(random 100) < 50) then {
		_unit addWeapon "Binocular";

		_hasBinoculars = true;
	};
};

if(floor(random 100) < 15) then {
	_unit addWeapon "NVgoggles";

	_hasBinoculars = true;
};

[_unit, _unitType] call randomAIWeapons;

_unit
