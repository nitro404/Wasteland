#include "dialog\helicopterStoreDefines.sqf";

disableSerialization;

_price = 0;

_dialog = findDisplay helicopterStore_DIALOG;

_itemlist = _dialog displayCtrl helicopterStore_item_list;

closeDialog helicopterStore_DIALOG;

_selectedItem = lbCurSel _itemlist;
_itemText = _itemlist lbText _selectedItem;

_nearestVehicles = nearestObjects[getPos helicopterStoreSpawn, ["Car", "Motorcycle", "Tank", "Helicopter", "Plane", "Ship", "StaticWeapon"], 10];

if(count _nearestVehicles > 0) exitWith {
	titleText["Helicopter purchase failed, spawn is currently blocked!", "PLAIN"];
	titleFadeOut 3;
};

{
	if(_itemText == _x select 0) then {
			_price = _x select 1;

			if(player getVariable "cmoney" < _price) exitWith {
				hintSilent format["You do not have enough money to purchase a %1.", _x select 0];
			};

			player setVariable["cmoney", (player getVariable "cmoney") - _price, true];

			_helicopter = createVehicle[(_x select 2), getPosATL helicopterStoreSpawn, [], 0, "CAN_COLLIDE"];
			_helicopter setPosATL getPosATL helicopterStoreSpawn;
			_helicopter setDir (getDir helicopterStoreSpawn);
			_helicopter setVariable["R3F_LOG_disabled", false, true];

			clearMagazineCargoGlobal _helicopter;
			clearWeaponCargoGlobal _helicopter;

			titleText[format["%1 Purchased!", _x select 0], "PLAIN"];
			titleFadeOut 3;
	};
} forEach helicopterStore;
