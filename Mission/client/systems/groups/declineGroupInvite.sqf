//	@file Version: 1.0
//	@file Name: declineGroupInvite.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#include "dialog\groupManagementDefines.sqf";

{
	if(getPlayerUID player == _x select 1) then {
	        currentInvites set [_forEachIndex, "TEMP"];
	        currentInvites = currentInvites - ["TEMP"];
	        publicVariableServer "currentInvites";
	};
} forEach currentInvites;

player globalChat format["You have declined theg group invite"];
