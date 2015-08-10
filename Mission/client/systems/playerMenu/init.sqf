//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: Tonic, [404] Costlyy
//	@file Created: NA
//	@file Args:


#include "dialog\player_sys.sqf";

if(dialog) exitWith { };

disableSerialization;

private["_dialog", "_moneyText", "_moneyValue", "_rogue", "_uptime", "_frameRate", "_timeText", "_missionUptimeText"];

//_playerDialog = createDialog "playerSettings";

createDialog "playerSettings";
_playerDialog = uiNamespace getVariable "playerSettings";
_playerDialog displayAddEventHandler["KeyDown", "_return = false; if(playerMenuDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];

playerMenuDialogActive = true;

_dialog = findDisplay playersys_DIALOG;
_moneyText = _dialog displayCtrl money_text;
_moneyValue = _dialog displayCtrl money_value;
_rogue = _dialog displayCtrl rogue_text;
_uptime = _dialog displayCtrl uptime_text;
_groupButton = _dialog displayCtrl groupButton;
_frameRate = _dialog displayCtrl frame_rate_text;

if(isNil {player getVariable "cmoney"}) then {
	_moneyValue ctrlSetText "0";
}
else {
	_moneyValue ctrlSetText format["%1", player getVariable "cmoney"];
};

while {playerMenuDialogActive} do {
	if(isNil {player getVariable "cmoney"}) then {
		_moneyText ctrlSetText "0";
	}
	else {
		_moneyText ctrlSetText format["%1", player getVariable "cmoney"];
	};

	_timeText = [time/60/60] call BIS_fnc_timeToString;
	_uptime ctrlSetText format["Mission Uptime: %1", _timeText];

	_frameRate ctrlSetText format["Server Frame Rate: %1", serverFPS];

	sleep 0.1;
}
