//	@file Version: 1.0
//	@file Name: checkAdmin2.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19

if(serverCommandAvailable "#kick") then {
	[serverAdministrators, getPlayerUID player] call BIS_fnc_arrayPush;
	player sideChat "You have been made admin, please re-open the menu.";
};
