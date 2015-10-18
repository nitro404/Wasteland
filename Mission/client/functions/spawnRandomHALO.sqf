//	@file Version: 1.0
//	@file Name: spawnRandomHALO.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:
//      Edited to HALO/paradrop at random spawns

waitUntil { !isNil "bis_fnc_init" };

private["_townName", "_randomLoc", "_pos"];

_randomLoc = townList select (random (count townList - 1));
_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,1,(_randomLoc select 1), 1, 0, 0, 0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
_pos = [_pos, 1, 75, 1, 0, 0, 0] call BIS_fnc_findSafePos;
player setPos _pos;
2 cutText ["HALO jump initialized. Use MOUSEWHEEL to open Your parachute! Press E to detach chute.", "PLAIN DOWN", 5];
player setPos [_pos select 0, _pos select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO
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

[_randomLoc select 2] spawn spawnInfoText;

while {((getposATL player) select 2) > 1} do {
	hintsilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];
};

if(((getposATL player) select 2) <= 1) then {
	hintsilent "";
};
