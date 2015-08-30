//	@file Version: 1.0
//	@file Name: populateVehicles.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: [int _category]

#include "dialog\vehicleManagementDefines.sqf";

disableSerialization;

private["_uid", "_category", "_allVehicles", "_vehicleType", "_vehicleIndex", "_dialog", "_vehicleListBox", "_weaponText", "_userText", "_damageText", "_speedText"];

_uid = getPlayerUID player;

if((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
	_category = _this select 0;
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

	if(_category == 0) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Car" && !(_vehicleType isKindOf "Wheeled_APC")) then {
				_vehicleIndex = _vehicleListBox lbAdd typeOf _x;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_category == 1) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Helicopter") then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_category == 2) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Plane") then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_category == 3) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType isKindOf "Tank" || _vehicleType isKindOf "Wheeled_APC") then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};

	if(_category == 4) then {
		{
			_vehicleType = typeOf _x;
			if(_vehicleType in vehicleBlacklist) then {
				_vehicleIndex = _vehicleListBox lbAdd _vehicleType;
				_vehicleListBox lbSetData[_vehicleIndex, str(_x)];
			};
		} forEach _allVehicles;
	};
}
else {
	exit;
};
