//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: Tonic, [404] Costlyy
//	@file Created: NA

#include "dialog\player_sys.sqf";

if(dialog) exitWith { };

disableSerialization;

private["_dialog", "_moneyText", "_moneyValue", "_rogue", "_uptime", "_frameRate", "_timeText", "_missionUptimeText"];

createDialog "playerSettings";

playerMenuDialogActive = true;

_dialog = findDisplay playersys_DIALOG;
_moneyText = _dialog displayCtrl money_text;
_moneyValue = _dialog displayCtrl money_value;
_bountyText = _dialog displayCtrl bounty_text;
_rogue = _dialog displayCtrl rogue_text;
_uptime = _dialog displayCtrl uptime_text;
_groupButton = _dialog displayCtrl groupButton;
_frameRate = _dialog displayCtrl frame_rate_text;

if(isNil { player getVariable "money" }) then {
	_moneyValue ctrlSetText "0";
}
else {
	_moneyValue ctrlSetText format["%1", player getVariable "money"];
};

while { playerMenuDialogActive } do {
	if(isNil { player getVariable "money" }) then {
		_moneyText ctrlSetText "0";
	}
	else {
		_moneyText ctrlSetText format["%1", player getVariable "money"];
	};

	if(isNil { player getVariable "bounty" }) then {
		_bountyText ctrlSetText "0";
	}
	else {
		_bountyText ctrlSetText format["%1", player getVariable "bounty"];
	};

	_timeText = [time/60/60] call BIS_fnc_timeToString;
	_uptime ctrlSetText format["Uptime: %1", _timeText];

	if(isNil { serverFPS }) then {
		_frameRate ctrlSetText "Server FPS: 0";
	}
	else {
		_frameRate ctrlSetText format["Server FPS: %1", floor(serverFPS)];
	};

	sleep 0.1;
}
