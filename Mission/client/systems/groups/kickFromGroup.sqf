//	@file Version: 1.0
//	@file Name: kickFromGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#include "dialog\groupManagementDefines.sqf";

disableSerialization;

private["_dialog", "_playerListBox", "_groupInvite", "_target", "_index", "_playerData", "_check", "_unitCount"];

_dialog = findDisplay groupManagementDialog;
_groupListBox = _dialog displayCtrl groupManagementGroupList;

_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;
_check = 0;

{
	if(str _x == _playerData) then {
		_target = _x;
		_check = 1;
	};
} forEach playableUnits;

if(_target == player) exitWith {
	player globalChat "You can't kick yourself.";
};

if(_check == 0) exitWith {
	player globalChat "You must select someone to kick first.";
};

[_target] join grpNull;

player globalChat format["You have kicked %1 from the group.", name _target];
