#include "dialog\buildingStoreDefines.sqf";

disableSerialization;

_dialog = findDisplay buildingStore_DIALOG;

_itemList = _dialog displayCtrl buildingStore_item_list;

_buildingPriceText = _dialog displayCtrl buildingStore_price;

_selectedItem = lbCurSel _itemList;

_itemText = _itemList lbText _selectedItem;

_buildingPriceText ctrlSetText format ["Price: $0"];

{
	if(_itemText == _x select 0) then {
		_buildingPriceText ctrlSetText format ["Price: $%1", _x select 1];
	}
} forEach buildingStore;
