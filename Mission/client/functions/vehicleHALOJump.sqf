player action["eject", vehicle player];
player removeWeapon "ParachuteWest";

sleep 0.1;

2 cutText ["HALO jump initialized. Use MOUSEWHEEL to open Your parachute! Press E to detach chute.", "PLAIN DOWN", 5];

player spawn bis_fnc_halo;

[] spawn spawnInfoText;

while {((getposATL player) select 2) > 1} do {
	hintsilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];
};

if (((getposATL player) select 2) < 1) then {
	hintsilent "";
};
