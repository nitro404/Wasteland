//	@file Version: 1.0
//	@file Name: randomAIWeapon.sqf
//	@file Author: nitro glycerine
//	@file Created: 05/11/2015 9:26 AM
//	@file Args: [unit, weaponList] call randomAIWeapon;

private["_unit", "_weaponClass", "_magazineArray", "_currentMagazine", "_numberOfMagazines"];

if(!isServer) exitWith { };

if(count _this < 2) exitWith { };

_unit = _this select 0;
_weaponClass = ((_this select 1) call BIS_fnc_selectRandom) call BIS_fnc_selectRandom;

_magazineArray = [];

if(_weaponClass == "BAF_NLAW_Launcher") then {
	_magazineArray = ["NLAW"]
};

if(_weaponClass == "SMAW") then {
	_magazineArray = ["SMAW_HEAA", "SMAW_HEDP"];
};

if(count _magazineArray == 0) then {
	_magazineArray = getArray (configFile >> "Cfgweapons" >> _weaponClass >> "magazines");
};

_numberOfMagazines = floor((random 2) + 2);

_currentMagazine = 0;

while { _currentMagazine < _numberOfMagazines } do {
	_unit addMagazine (_magazineArray call BIS_fnc_selectRandom);

	_currentMagazine = _currentMagazine + 1;
};

_unit addWeapon _weaponClass;
