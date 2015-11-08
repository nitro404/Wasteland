//	@file Version: 1.0
//	@file Name: createAIGroup.sqf
//	@file Author: nitro glycerine
//	@file Created: 07/11/2015 11:52 PM
//	@file Args: [position, radius, groupSize] call createAIGroup;

private["_position", "_radius", "_groupSize", "_aiGroup", "_unit"];

if(!isServer) exitWith { };

if(count _this < 3) exitWith { };

_position = _this select 0;
_radius = _this select 1;
_groupSize = _this select 2;
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

if(isNil { _groupSize }) then {
	_groupSize = floor(random 2) + 2;
};

if(typeName _groupSize != "SCALAR") then {
	_groupSize = floor(random 2) + 2;
};

if(_groupSize < 1) then {
	_groupSize = floor(random 2) + 2;
};

for "_unitIndex" from 1 to _groupSize do {
	_unit = [_aiGroup, [_position, _radius, true] call randomPosition, "Woodlander4", floor(random 5) + 1] call createAIUnit;
	_unit addMPEventHandler["MPKilled", { [_this] call onAIKilled; } ];
};

_aiGroup
