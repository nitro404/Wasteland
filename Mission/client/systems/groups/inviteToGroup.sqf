//	@file Version: 1.0
//	@file Name: inviteToGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

// if(player != leader group player) exitWith { player globalChat format["You are not the leader and can't invite people"]; };

#include "dialog\groupManagementDefines.sqf";

disableSerialization;

private["_dialog", "_playerListBox", "_groupInvite", "_target", "_index", "_playerData", "_check", "_unitCount", "_hasInvite"];

_dialog = findDisplay groupManagementDialog;
_playerListBox = _dialog displayCtrl groupManagementPlayerList;

_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;
_check = 0;

{
	if(str(_x) == _playerData) then {
		_target = _x;
		_check = 1;
	};
} forEach playableUnits;

if(_check == 0) exitWith {
	player globalChat "You must select someone to invite first";
};

if(_target == player) exitWith {
	player globalChat "You can't invite yourself";
};

if((count units group _target) > 1) exitWith {
	player globalChat "This player is already in a group";
};

{
	if(_x select 1 == getPlayerUID _target) then{
		_hasInvite = true;
	};
} forEach currentInvites;

if(_hasInvite) exitWith {
	player globalChat "This player already has a pending invite";
};

[currentInvites, [getPlayerUID player, getPlayerUID _target]] call BIS_fnc_arrayPush;
publicVariableServer "currentInvites";

[nil,_target,"loc", rTITLETEXT, format["You have been invited to join %1's group", name player], "PLAIN", 0] call RE;

player globalChat format["You have invited %1 to join the group", name _target];
