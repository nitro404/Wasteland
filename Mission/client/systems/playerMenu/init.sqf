//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: Tonic, [404] Costlyy
//	@file Created: NA
//	@file Args:


#include "dialog\player_sys.sqf";

if(dialog) exitWith { };

disableSerialization;

private["_dialog", "_moneyText", "_moneyValue", "_rogue"];

_playerDialog = createDialog "playerSettings";

_dialog = findDisplay playersys_DIALOG;
_moneyText = _dialog displayCtrl money_text;
_moneyValue = _dialog displayCtrl money_value;
_rogue = _dialog displayCtrl rogue_text;
_uptime = _dialog displayCtrl uptime_text;
_groupButton = _dialog displayCtrl groupButton;

if(isNil {player getVariable "cmoney"}) then {
	_moneyText ctrlSetText "0";
	_moneyValue ctrlSetText "0";
}
else {
	_moneyText ctrlSetText format["%1", player getVariable "cmoney"];
	_moneyValue ctrlSetText format["%1", player getVariable "cmoney"];
};
