//	@file Version: 1.0
//	@file Name: enteredVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 17/10/2015 6:58 PM
//	@file Args: [vehicle, position, unit] call enteredVehicle;

private["_vehicle", "_position", "_player"];

_vehicle = _this select 0;
_position = _this select 1;
_player = _this select 2;

_vehicle setVariable["enterTime", time, false];

if(alive _player) then {
	diag_log format["%1 entered %2 in position %3.", name _player, typeof _vehicle, _position];
};
