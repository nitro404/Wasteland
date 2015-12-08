//	@file Version: 1.0
//	@file Name: relations.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

if(!isServer) exitWith { };

diag_log format["Setting Faction Relations"];

EAST setFriend [WEST, 0];
EAST setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 0];

WEST setFriend [EAST, 0];
WEST setFriend [WEST, 1];
WEST setFriend [RESISTANCE, 0];

RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [RESISTANCE, 1];

CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [RESISTANCE, 0];
CIVILIAN setFriend [CIVILIAN, 1];
