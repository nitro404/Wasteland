//	@file Version: 1.0
//	@file Name: deleteVehicle.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "dialog\vehicleManagementDefines.sqf";

disableSerialization;

private["_uid", "_dialog", "_vehicleListBox", "_selectedItemData", "_allVehicles", "_vehicle", "_selectedItem"];

_uid = getPlayerUID player;

if((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
	_allVehicles = vehicles;

	_dialog = findDisplay vehicleManagementDialog;
	_vehicleListBox = _dialog displayCtrl vehicleManagementListBox;

	_selectedItem = lbCurSel _vehicleListBox;
	_selectedItemData = _vehicleListBox lbData _selectedItem;

	player commandChat format ["Deleting %1", _selectedItemData];
	{
		_vehicle = _x;
		if(str(_vehicle) == _selectedItemData) then {
			{
				_x leaveVehicle _vehicle;
			} forEach crew _vehicle;

			player globalChat format["Deleted %1.", typeOf _x];

			deleteVehicle _vehicle;
		};
	} forEach _allVehicles;

	closeDialog 0;

	execVM "client\systems\adminPanel\vehicleManagement.sqf";
}
else {
	exit;
};
