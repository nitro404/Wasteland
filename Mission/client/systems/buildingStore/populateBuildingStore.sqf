#include "dialog\buildingStoreDefines.sqf";

disableSerialization;

_dialog = findDisplay buildingStore_DIALOG;

_itemList = _dialog displayCtrl buildingStore_item_list;
lbClear _itemList;
_itemList lbSetCurSel -1;

{
	_itemlistIndex = _itemList lbAdd format["%1", _x select 0];
} forEach buildingStore;
