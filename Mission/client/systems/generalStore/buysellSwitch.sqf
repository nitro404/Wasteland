//	@file Version: 1.0
//	@file Name: buySellSwitch.sqf
//	@file Author: [404] Deadbeat,[404] Costlyy
//	@file Created: 20/11/2012 05:13

#include "dialog\genstoreDefines.sqf";

disableSerialization;

_dialog = findDisplay genstore_DIALOG;
_buySell = _dialog displayCtrl genstore_buysell;

_switchText = Ctrltext _buySell;

if(_switchText == "Buy") then {
	execVM "client\systems\generalStore\buyItems.sqf";
}
else {
	execVM "client\systems\generalStore\sellItems.sqf";
};
