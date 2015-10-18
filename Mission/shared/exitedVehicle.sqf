//	@file Version: 1.0
//	@file Name: exitedVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 17/10/2015 6:59 PM
//	@file Args: [[vehicle, position, unit]] call exitedVehicle;

private["_vehicle"];

_args = _this select 0;
_vehicle = _args select 0;
_position = _args select 1;
_player = _args select 2;

_vehicle setVariable["exitTime", time, false];

diag_log format["%1 exited %2 from position %3.", name _player, typeof _vehicle, _position];
