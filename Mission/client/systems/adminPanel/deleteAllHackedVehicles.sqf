private["_numberOfDeletedVehicles", "_allVehicles"];

_numberOfDeletedVehicles = 0;
_allVehicles = vehicles;

{
	if(typeOf _x in vehicleBlacklist) then {
		player globalChat format["Deleted %1.", typeOf _x];

		deleteVehicle _x;

		_numberOfDeletedVehicles = _numberOfDeletedVehicles + 1;
	};
} forEach _allVehicles;

player commandChat format["Deleted %1 hacked vehicles.", _numberOfDeletedVehicles];

closeDialog 0;

execVM "client\systems\adminPanel\vehicleManagement.sqf";
