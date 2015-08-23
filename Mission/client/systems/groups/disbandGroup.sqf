//	@file Version: 1.0
//	@file Name: disbandGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#include "dialog\groupManagementDefines.sqf";

{
	[_x] join grpNull;
} forEach units group player;
