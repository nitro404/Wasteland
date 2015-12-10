//	@file Version: 1.0
//	@file Name: createAIGroup.sqf
//	@file Author: nitro glycerine
//	@file Created: 07/11/2015 11:52 PM
//	@file Args: [position, radius, groupSize] call createAIGroup;

private["_position", "_radius", "_unitTypes", "_aiGroup", "_unit", "_numberOfUnitTypes", "_numberOfUnits"];

if(!isServer) exitWith { };

if(count _this < 3) exitWith { };

_position = _this select 0;
_radius = _this select 1;
_unitTypes = _this select 2;
_aiGroup = createGroup civilian;
_unit = nil;

if(isNil { _radius }) then {
	_radius = floor(random 5) + 5;
};

if(typeName _radius != "SCALAR") then {
	_radius = floor(random 5) + 5;
};

if(_radius < 5) then {
	_radius = floor(random 5) + 5;
};

if(isNil { _unitTypes }) then {
	_unitTypes = [1, 0, 0, 0, 0];
};

if(typeName _unitTypes != "ARRAY") then {
	_unitTypes = [1, 0, 0, 0, 0];
};

_numberOfUnitTypes = count _unitTypes;
for "_unitType" from 1 to _numberOfUnitTypes do {
	_numberOfUnits = _unitTypes select _unitType - 1;

	for "_unitIndex" from 1 to _numberOfUnits do {
		_unit = [_aiGroup, [_position, _radius, true] call randomPosition, _unitType] call createAIUnit;
	};
};

_aiGroup
