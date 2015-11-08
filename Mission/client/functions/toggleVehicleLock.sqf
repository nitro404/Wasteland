if(isDedicated) exitWith { };

if(vehicle player == player) exitWith { };

if(!alive player) exitWith { };

if(!alive vehicle player) exitWith { };

if(vehicle player isKindOf "ParachuteBase") exitWith { };

_vehicleLocked = locked vehicle player;

if(_vehicleLocked) then {
	vehicle player setVehicleLock "UNLOCKED";

	player globalChat format["%1 is now unlocked.", typeOf vehicle player];
}
else {
	vehicle player setVehicleLock "LOCKED";

	player globalChat format["%1 is now locked.", typeOf vehicle player];
};
