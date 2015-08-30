//	@file Version: 1.0
//	@file Name: respawnVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 30/08/2015 1:50 PM
//	@file Args:

if(!X_Server) exitWith { };

private["_vehicle", "_respawnDelay", "_desertedTime", "_monitorVehicle", "_result", "_vehiclePosition", "_vehicleDirection", "_vehicleType", "_dead", "_nodelay", "_startTime", "_currTime", "_timeout"];

if(count _this < 1) exitWith {
    diag_log format["respawnVehicle Error: Requires minimum of 1 arguments, received %1.", count _this]
};

#include "setup.sqf"

_vehicle = _this select 0;
_respawnDelay = 0;
_desertedTime = 0;

if(typeName _vehicle != "OBJECT") exitWith {
    diag_log format["respawnVehicle Arg0 Error: Invalid vehicle argument - expected object, received %1.", typeName _vehicle]
};

if(count _this > 1) then {
	if(typeName (_this select 1) == "SCALAR") then {
		_respawnDelay = _this select 1;

		if(_respawnDelay < 0) then {
			_respawnDelay = 0;
		};

		if(count _this > 2) then {
			if(typeName (_this select 2) == "SCALAR") then {
				_desertedTime = _this select 2;

				if(_desertedTime < 0) then {
					_desertedTime = 0;
				};
			}
			else {
				if(true) exitWith {
					diag_log format["respawnVehicle Arg2 Error: Invalid deserted time argument - expected scalar, received %1.", typeName (_this select 2)]
				};
			};
		};
	}
	else {
		if(true) exitWith {
			diag_log format["respawnVehicle Arg1 Error: Invalid respawn delay argument - expected scalar, received %1.", typeName (_this select 1)]
		};
	};
};

_monitorVehicle = true;
_result = 0;

_vehiclePosition = getPos _vehicle;
_vehicleDirection = getDir _vehicle;
_vehicleType = typeOf _vehicle;
_dead = false;
_nodelay = false;

#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif

while { _monitorVehicle } do {
	#ifdef __A2NET__
	_currTime = floor(netTime);
	#else
	_currTime = floor(time);
	#endif

	if(_currTime - _startTime >= 300) then {
		_result = 1;
	};

	if(_result == 1) then {
	        sleep 5;

		if((getDammage _vehicle > 0.8) and ({ alive _x } count crew _vehicle == 0)) then {
			_dead = true
		};

		if(_desertedTime > 0) then {
			if((getPos _vehicle distance _vehiclePosition > 10) and ({ alive _x } count crew _vehicle == 0) and (getDammage _vehicle < 0.8)) then {
				#ifdef __A2NET__
				_timeout = netTime + _desertedTime;
				#else
				_timeout = time + _desertedTime;
				#endif

				sleep 0.1;

				#ifdef __A2NET__
			 	waitUntil { _timeout < netTime or !alive _vehicle or { alive _x } count crew _vehicle > 0 };
				#else
				waitUntil { _timeout < time or !alive _vehicle or { alive _x } count crew _vehicle > 0 };
				#endif

				if({ alive _x } count crew _vehicle > 0) then {
					_dead = false
				};

				if({ alive _x } count crew _vehicle == 0) then {
					_dead = true;
					_nodelay = true
				};

				if(!(alive _vehicle)) then {
					_dead = true;
					_nodelay = false
				};
			};
		};

		if(_dead) then {
			if(_nodelay) then {
				sleep 0.1;
				_nodelay = false;
			}
			else {
				sleep _respawnDelay;
			};

			sleep 0.1;

			deleteVehicle _vehicle;

			sleep 2;

			[_vehiclePosition, _vehicleDirection, _vehicleType, false, true, _respawnDelay] call spawnVehicle;

			_monitorVehicle = false;
		};

		#ifdef __A2NET__
		_startTime = floor(netTime);
		#else
		_startTime = floor(time);
		#endif

		_result = 0;
	} else {
		sleep 5;
	};

	sleep 1;
};
