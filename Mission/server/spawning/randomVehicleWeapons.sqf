//	@file Version: 1.0
//	@file Name: randomVehicleWeapons.sqf
//	@file Author: nitro glycerine
//	@file Created: 30/08/2015 05:19
//	@file Args: [vehicle] call randomVehicleWeapons;

if(!isServer) exitWith { };

private["_vehicle", "_maxMagazines", "_maxWeapons", "_weapon", "_magazineArray", "_magazine", "_numberOfRandomWeapons", "_currentMagazine", "_numberOfMagazines", "_totalMagazines"];

_vehicle = _this select 0;

_maxWeapons = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportMaxWeapons");
_maxMagazines = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportMaxMagazines");

_numberOfRandomWeapons = (random 3) + 2;
_totalWeapons = 0;
_totalMagazines = 0;

if(_numberOfRandomWeapons > _maxWeapons) then {
	_numberOfRandomWeapons = _maxWeapons;
};

while { _totalWeapons < _numberOfRandomWeapons } do {
	_weapon = [randomWeapons] call randomObject;

	_magazineArray = [];

	if(_weapon == "BAF_NLAW_Launcher") then {
		_magazineArray = ["NLAW"]
	};

	if(_weapon == "SMAW") then {
		_magazineArray = ["SMAW_HEAA", "SMAW_HEDP"];
	};

	if(count _magazineArray == 0) then {
		_magazineArray = getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines");
	};

	_numberOfMagazines = floor((random 2) + 4);

	if(_totalMagazines + _numberOfMagazines > _maxMagazines) then {
		_numberOfMagazines = _maxMagazines - _totalMagazines;
	};

	if(_numberOfMagazines > 0) then {
		_currentMagazine = 0;

		while { _currentMagazine < _numberOfMagazines } do {
			_vehicle addMagazineCargoGlobal[_magazineArray select (floor (random count _magazineArray)), 1];

			_currentMagazine = _currentMagazine + 1;
		};

		_vehicle addWeaponCargoGlobal[_weapon, 1];

		_totalMagazines = _totalMagazines + _numberOfMagazines;
	};

	_totalWeapons = _totalWeapons + 1;
};

if(_totalWeapons < _maxWeapons) then {
	if(floor(random 100) < 50) then {
		_vehicle addWeaponCargoGlobal ["Binocular_Vector", 1];

		_totalWeapons = _totalWeapons + 1;
	};
};

if(_totalWeapons < _maxWeapons) then {
	if(floor(random 100) < 15) then {
		_vehicle addWeaponCargoGlobal ["NVgoggles", 1];

		_totalWeapons = _totalWeapons + 1;
	};
};

if(_totalWeapons < _maxWeapons && _totalMagazines < _maxMagazines) then {
	if(floor(random 100) < 2) then {
		_vehicle addWeaponCargoGlobal ["Laserdesignator", 1];
		_vehicle addMagazineCargoGlobal ["Laserbatteries", 1];

		_totalWeapons = _totalWeapons + 1;
		_totalMagazines = _totalMagazines + 1;
	};
};
