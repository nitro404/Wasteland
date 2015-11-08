//	@file Version: 1.0
//	@file Name: randomPosition.sqf
//	@file Author: nitro glycerine
//	@file Created: 26/08/2015 4:42 PM
//	@file Args: [position, radius] call randomPosition;
//                  ie. [[124.0, 228.0, 0.0], 128, true] call randomPosition;
//                  [position, radius, checkWater] call randomPosition;
//                  ie. [[124.0, 228.0, 0.0], 128, true] call randomPosition;

private["_basePosition", "_baseRadius", "_checkWater", "_invalidPosition", "_positionOffset", "_positionRotation", "_randomPosition"];

if(count _this < 2) exitWith {
	diag_log format["randomPosition Error: Requires minimum of 2 arguments, received %1.", count _this]
};

_basePosition = _this select 0;
_baseRadius = _this select 1;
_checkWater = true;

if(typeName _basePosition != "ARRAY") exitWith {
	diag_log format["randomPosition Arg0 Error: Invalid position argument - expected array, received %1.", typeName _basePosition]
};

if(typeName _baseRadius != "SCALAR") exitWith {
	diag_log format["randomPosition Arg1 Error: Invalid radius argument - expected scalar, received %1.", typeName _baseRadius]
};

if(count _this > 2) then {
	if(typeName (_this select 2) == "BOOL") then {
		_checkWater = _this select 2;
	}
	else {
		diag_log format["randomPosition Arg2 Error: Invalid check water argument - expected bool, received %1.", typeName (_this select 2)];
	};
};

_invalidPosition = true;
while { _invalidPosition } do {
	_positionOffset = floor(_baseRadius * 0.15) + floor(random (_baseRadius * 0.85));
	_positionRotation = floor(random 360);
	_randomPosition = [(_basePosition select 0) + (_positionOffset * cos(_positionRotation)), (_basePosition select 1) + (_positionOffset * sin(_positionRotation)), _basePosition select 2];

	_invalidPosition = _checkWater && surfaceIsWater _randomPosition;
};

_randomPosition
