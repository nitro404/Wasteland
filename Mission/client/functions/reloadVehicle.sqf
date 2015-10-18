//	@file Version: 1.0
//	@file Name: reloadVehicle.sqf
//	@file Author: Xeno, nitro glycerine
//	@file Created: 18/10/2015 3:30 PM
//	@file Args: [vehicle] execVM "reloadVehicle.sqf";

private["_vehicle", "_vehicleType", "_lastServiceTime", "_canService", "_timeRemaining", "_magazines", "_removedMagazines", "_turretCount", "_turretConfig", "_turretMagazines", "_removedTurretMagazines", "_driverTurretCount", "_driverTurretConfig", "_driverTurretMagazines", "_removedDriverMagazines"];

_vehicle = _this select 0;
_lastServiceTime = _vehicle getVariable "lastServiceTime";

_canService = true;

if(!isNil { _lastServiceTime }) then {
	_timeRemaining = 60 - floor(time - _lastServiceTime);

	if(_timeRemaining < 0) then {
		_timeRemaining = 0;
	};

	if(_timeRemaining > 0) then {
		_vehicle vehicleChat format["You can only service a vehicle once every minute, %1 seconds remaining.", _timeRemaining];

		_canService = false;
	};
};

if(!_canService) exitWith { };

if(_vehicle isKindOf "ParachuteBase") exitWith { };

if(!alive _vehicle) exitWith { };

_vehicle setVariable["lastServiceTime", time, false];

_vehicleType = typeOf _vehicle;

_vehicle vehicleChat format["Servicing %1, please stand by...", _vehicleType];

sleep 0.1;

if(!alive _vehicle) exitWith { };

_vehicle vehicleChat format["Repairing %1...", _vehicleType];

_vehicle setDamage 0;

sleep 0.1;

if(!alive _vehicle) exitWith { };

_vehicle vehicleChat format["Refueling %1...", _vehicleType];

_vehicle setFuel 1;

sleep 0.1;

_vehicle setVehicleAmmo 1;

_magazines = getArray(configFile >> "CfgVehicles" >> _vehicleType >> "magazines");

if(count _magazines > 0) then {
	_removedMagazines = [];
	{
		if(!(_x in _removedMagazines)) then {
			_vehicle removeMagazines _x;
			_removedMagazines set[count _removedMagazines, _x];
		};
	} forEach _magazines;

	{
		_vehicle vehicleChat format ["Reloading %1...", _x];

		sleep 0.1;

		if(!alive _vehicle) exitWith { };

		_vehicle addMagazine _x;
	} forEach _magazines;
};

if(!alive _vehicle) exitWith { };

_turretCount = count (configFile >> "CfgVehicles" >> _vehicleType >> "Turrets");

if(_turretCount > 0) then {
	for "_i" from 0 to (_turretCount - 1) do {
		scopeName "reloadVehicle";

		_turretConfig = (configFile >> "CfgVehicles" >> _vehicleType >> "Turrets") select _i;
		_turretMagazines = getArray(_turretConfig >> "magazines");
		_removedTurretMagazines = [];

		{
			if(!(_x in _removedTurretMagazines)) then {
				_vehicle removeMagazines _x;
				_removedTurretMagazines set[count _removedTurretMagazines, _x];
			};
		} forEach _turretMagazines;

		{
			_vehicle vehicleChat format ["Reloading %1...", _x];

			sleep 0.1;

			if(!alive _vehicle) then { breakOut "reloadVehicle" };

			_vehicle addMagazine _x;

			sleep 0.1;

			if(!alive _vehicle) then { breakOut "reloadVehicle" };
		} forEach _turretMagazines;

		_driverTurretCount = count (_turretConfig >> "Turrets");

		if(_driverTurretCount > 0) then {
			for "_i" from 0 to (_driverTurretCount - 1) do {
				_driverTurretConfig = (_turretConfig >> "Turrets") select _i;
				_driverTurretMagazines = getArray(_driverTurretConfig >> "magazines");
				_removedDriverMagazines = [];

				{
					if (!(_x in _removedDriverMagazines)) then {
						_vehicle removeMagazines _x;
						_removedDriverMagazines set[count _removedDriverMagazines, _x];
					};
				} forEach _driverTurretMagazines;

				{
					_vehicle vehicleChat format ["Reloading %1", _x];

					sleep 0.1;

					if(!alive _vehicle) then { breakOut "reloadVehicle" };

					_vehicle addMagazine _x;

					sleep 0.1;

					if(!alive _vehicle) then { breakOut "reloadVehicle" };
				} forEach _driverTurretMagazines;
			};
		};
	};
};

_vehicle setVehicleAmmo 1;

sleep 0.1;

if(!alive _vehicle) exitWith { };

_vehicle vehicleChat format ["%1 is ready...", _vehicleType];
