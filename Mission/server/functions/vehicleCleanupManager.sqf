//	@file Version: 1.0
//	@file Name: vehicleCleanupManager.sqf
//	@file Author: nitro glycerine
//	@file Created: 13/10/2015 6:25 PM

if(!isServer) exitWith { };

private["_vehicles", "_cleanup"];

while { true } do {
	_vehicles = vehicles;

	sleep 0.1;

	{
		_cleanup = false;

		if(_x isKindOf "LandVehicle") then {
			_cleanup = true;
		}
		else {
			if(_x isKindOf "Air") then {
				_cleanup = true;
			}
			else {
				if(_x isKindOf "Ship") then {
					_cleanup = true;
				};
			};
		};

		if(_cleanup) then {
			_x call cleanupVehicle;

			sleep 0.05;
		};
	} forEach _vehicles;

	sleep 60;
};
