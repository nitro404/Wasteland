//	@file Version: 1.0
//	@file Name: spawnRandomHALO.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19

waitUntil { !isNil "bis_fnc_init" };

private["_town", "_position"];

_town = townList call BIS_fnc_selectRandom;
_position = [getMarkerPos (_town select 0), 1, _town select 1, 1, 0, 0, 0] call BIS_fnc_findSafePos;
player setPos [_position select 0, _position select 1, 1000];

2 cutText ["HALO jump initialized. Use MOUSEWHEEL to open Your parachute! Press E to detach chute.", "PLAIN DOWN", 1];
[player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";

respawnDialogActive = false;
closeDialog 0;

//Force 3rd person view at spawning
firstperson_allowed = false;
while { not firstperson_allowed } do {
	if(cameraView == "INTERNAL" || cameraView == "GROUP") then {
		vehicle player switchCamera "EXTERNAL";
	};

	sleep 0.1;

	firstperson_allowed = true;
};

[_town select 2] spawn spawnInfoText;

while { ((getposATL player) select 2) > 1 } do {
	hintSilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];
	sleep 0.1;
};

2 cutText ["", "PLAIN DOWN", 1];
hintSilent "";
