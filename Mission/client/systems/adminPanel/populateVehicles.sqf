//	@file Version: 1.0
//	@file Name: populateVehicles.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: int

#include "dialog\vehicleManagementDefines.sqf";

disableSerialization;

private["_uid", "_allVehicles", "_vehicleType", "_vehicleIndex", "_dialog", "_vehicleListBox", "_weaponText", "_userText", "_damageText", "_speedText"];

_uid = getPlayerUID player;

if((_uid in moderators) || (_uid in administrators) || (_uid in serverAdministrators)) then {
	_allVehicles = vehicles;

	_dialog = findDisplay vehicleManagementDialog;
	_vehicleListBox = _dialog displayCtrl vehicleManagementListBox;
	_weaponText = _dialog displayCtrl vehicleWeaponsText;
	_userText = _dialog displayCtrl vehicleUsersText;
	_damageText = _dialog displayCtrl vehicleDamageText;
	_speedText = _dialog displayCtrl vehicleSpeedText;

	lbClear _vehicleListBox;
	_weaponText ctrlSetText format["Weapons:"];
	_speedText ctrlSetText format["Speed:"];
	_userText ctrlSetText format["Users:"];
	_damageText ctrlSetText format["Damage:"];

	if(_this == 0) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Car" && !(_vehicleType isKindOf "Wheeled_APC")) then {
				_vehicleIndex = _vehicleListBox lbAdd typeOf _x;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_this == 1) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Helicopter") then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_this == 2) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Plane") then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_this == 3) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Tank" || _vehicleType isKindOf "Wheeled_APC") then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_this == 4) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType in vehicleBlacklist) then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};
};
