#include "dialog\helicopterStoreDefines.sqf";

disableSerialization;

_dialog = findDisplay helicopterStore_DIALOG;

_itemList = _dialog displayCtrl helicopterStore_item_list;

_helicopterPriceText = _dialog displayCtrl helicopterStore_price;

_selectedItem = lbCurSel _itemList;

_itemText = _itemList lbText _selectedItem;

_helicopterPriceText ctrlSetText "Price: $0";

{
	if(_itemText == _x select 0) then{
		_type = _x select 2;

		_item = (configFile >> "CfgVehicles" >> _type);

		_helicopterPriceText ctrlSetText format["Price: $%1", _x select 1];
	}
} forEach helicopterStore;
