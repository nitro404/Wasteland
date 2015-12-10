//	@file Version: 1.0
//	@file Name: spawnInitialObjects.sqf
//	@file Author: nitro glycerine
//	@file Created: 26/08/2015 5:21 PM
//	@file Args: call spawnInitialObjects;

if(!isServer) exitWith { };

private["_townPosition", "_townRadius", "_townName", "_numberOfVehicles", "_numberOfBuildings", "_numberOfStationaryWeapons", "_numberOfWeaponCrates", "_totalVehicles", "_totalWeaponCrates", "_totalBuildings", "_totalStationaryWeapons", "_currentObjectIndex"];

_totalVehicles = 0;
_totalWeaponCrates = 0;
_totalBuildings = 0;
_totalStationaryWeapons = 0;

{
	_townPosition = getMarkerPos (_x select 0);
	_townRadius = _x select 1;
	_townName = _x select 2;

	_numberOfVehicles = floor(_townRadius * 0.05);
	_numberOfWeaponCrates = floor(_townRadius * 0.03125);
	_numberOfBuildings = floor(_townRadius * 0.04);
	_numberOfStationaryWeapons = floor(_townRadius * 0.0225);

	_currentObjectIndex = 0;
	while { _currentObjectIndex < _numberOfVehicles } do {
		[[_townPosition, _townRadius, true] call randomPosition, random 360.0, vehicleCategories] call spawnVehicle;

		_totalVehicles = _totalVehicles + 1;
		_currentObjectIndex = _currentObjectIndex + 1;
	};

	_currentObjectIndex = 0;
	while { _currentObjectIndex < _numberOfWeaponCrates } do {
		[[_townPosition, _townRadius, true] call randomPosition, random 360.0, weaponCrateCategories] call spawnWeaponCrate;

		_totalWeaponCrates = _totalWeaponCrates + 1;
		_currentObjectIndex = _currentObjectIndex + 1;
	};

	_currentObjectIndex = 0;
	while { _currentObjectIndex < _numberOfBuildings } do {
		[[_townPosition, _townRadius, true] call randomPosition, random 360.0, buildingCategories] call spawnObject;

		_totalBuildings = _totalBuildings + 1;
		_currentObjectIndex = _currentObjectIndex + 1;
	};

	_currentObjectIndex = 0;
	while { _currentObjectIndex < _numberOfStationaryWeapons } do {
		[[_townPosition, _townRadius, true] call randomPosition, random 360.0, stationaryWeaponCategories] call spawnObject;

		_totalStationaryWeapons = _totalStationaryWeapons + 1;
		_currentObjectIndex = _currentObjectIndex + 1;
	};

	diag_log format["%1: Spawned %2 Vehicles, %3 Buildings, %4 Stationary Weapons and %5 Weapon Crates.", _townName, _numberOfVehicles, _numberOfBuildings, _numberOfStationaryWeapons, _numberOfWeaponCrates];

	sleep 0.1;
} forEach townList;

_currentObjectIndex = 0;
while { _currentObjectIndex < numberOfHelicopterSpawns } do {
	[getMarkerPos format["heliSpawn_%1", _currentObjectIndex + 1], random 360.0, helicopterCategories] call spawnVehicle;

	_currentObjectIndex = _currentObjectIndex + 1;
};

_currentObjectIndex = 0;
while { _currentObjectIndex < numberOfBoatSpawns } do {
	_boat = [getMarkerPos format["boatSpawn_%1", _currentObjectIndex + 1], random 360.0, boatCategories] call spawnVehicle;

	_currentObjectIndex = _currentObjectIndex + 1;
};

diag_log format["Spawning finished! Spawned %1 Vehicles, %2 Weapon Crates, %3 Buildings, %4 Stationary Weapons, %5 Boats and %6 Helicopters.", _totalVehicles, _totalWeaponCrates, _totalBuildings, _totalStationaryWeapons, numberOfBoatSpawns, numberOfHelicopterSpawns];
