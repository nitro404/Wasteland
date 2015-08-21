#include "dialog\helicopterStoreDefines.sqf";

disableSerialization;

_dialog = findDisplay helicopterStore_DIALOG;

_itemList = _dialog displayCtrl helicopterStore_item_list;

lbClear _itemList;

_itemList lbSetCurSel -1;

{
	_itemlistIndex = _itemList lbAdd format["%1", _x select 0];
} forEach helicopterStore;
