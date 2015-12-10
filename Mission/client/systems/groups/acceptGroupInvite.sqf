//	@file Version: 1.0
//	@file Name: acceptGroupInvite.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#include "dialog\groupManagementDefines.sqf";

private["_inviterUID", "_inviter"];

_groupExists = false;
{
	if(getPlayerUID player == _x select 1) then {
    	_inviterUID = _x select 0;
        currentInvites = [currentInvites, _forEachIndex] call BIS_fnc_removeIndex;
        publicVariableServer "currentInvites";
	};
} forEach currentInvites;

{
	if(getPlayerUID _x == _inviterUID) then {
    	_inviter = _x;
        _groupExists = true;
    };
} forEach playableUnits;

if(_groupExists) then {
	[player] join (group _inviter);
    player globalChat format["You have accepted the group invite."];
}
else {
	player globalChat format["The group no longer exists."];
};
