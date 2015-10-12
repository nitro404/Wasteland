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
        currentInvites set [_forEachIndex, objNull];
        currentInvites = currentInvites - [objNull];
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
    player globalChat format["You have accepted the group invite"];
}
else {
	player globalChat format["The group no longer exists"];
};
