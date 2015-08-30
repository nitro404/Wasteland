//	@file Version: 1.0
//	@file Name: randomWeapon.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args: Element 0 = Vehicle.

if(!X_Server) exitWith { };

private["_vehicle", "_randomGear", "_weapon", "_magazine", "_numberOfRandomWeapons", "_currentRandomWeapon"];

_vehicle = _this select 0;

if(_vehicle isKindOf "Motorcycle" || _vehicle isKindOf "Bicycle") exitWith { };

if(!(_vehicle isKindOf "Helicopter")) then {
	_randomGear = floor(random 100);

	if(_randomGear < 50) then {
		_vehicle addWeaponCargoGlobal ["Binocular_Vector", 1];
	};

	if(_randomGear < 15) then {
		_vehicle addWeaponCargoGlobal ["NVgoggles", 1];
	};
};

_numberOfRandomWeapons = (random 3) + 2;
_currentRandomWeapon = 0;

while { _currentRandomWeapon < _numberOfRandomWeapons } do {
	_weapon = vehicleWeapons select (random (count vehicleWeapons - 1));
	_magazine = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;

	_vehicle addMagazineCargoGlobal[_magazine, (random 2) + 4];
	_vehicle addWeaponCargoGlobal[_weapon, 1];

	_currentRandomWeapon = _currentRandomWeapon + 1;
};
