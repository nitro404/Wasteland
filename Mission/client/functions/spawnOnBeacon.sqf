//	@file Version: 1.0
//	@file Name: spawnOnBeacons.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: int(0 = button 0 etc)

#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407

disableSerialization;

private ["_respawnPosition", "_display", "_buttonZero", "_buttonOne", "_buttonTwo", "_buttonThree", "_buttonFour"];

_display = uiNamespace getVariable "RespawnSelectionDialog";
_buttonZero = _display displayCtrl respawn_Town_Button0;
_buttonOne = _display displayCtrl respawn_Town_Button1;
_buttonTwo = _display displayCtrl respawn_Town_Button2;
_buttonThree = _display displayCtrl respawn_Town_Button3;
_buttonFour = _display displayCtrl respawn_Town_Button4;

_respawnPosition = [];

_buttonClicked = false;

switch(_this) do {
    case 0: { _buttonClicked = _buttonZero };
    case 1: { _buttonClicked = _buttonOne };
    case 2: { _buttonClicked = _buttonTwo };
    case 3: { _buttonClicked = _buttonThree };
    case 4: { _buttonClicked = _buttonFour };
};

_spawnBeacons = nil;
switch (playerSide) do {
	case west: { _spawnBeacons = spawnBeaconsBluFor; };
	case east: { _spawnBeacons = spawnBeaconsOpFor; };
	case resistance: { _spawnBeacons = spawnBeaconsIndependent; };
};

_beacon = nil;
{
	if(ctrlText _buttonClicked == _x select 0) then {
		_beacon = _x;
	};
} forEach _spawnBeacons;

if(isNil { _beacon }) exitWith { };

_respawnPosition = _beacon select 1;
_respawnDir = _beacon select 4;

2 cutText ["HALO jump initialized. Use MOUSEWHEEL to open Your parachute! Press E to detach chute.", "PLAIN DOWN", 1];

[player, [_respawnPosition select 0, _respawnPosition select 1, 500], _respawnDir] execVM "client\functions\HALODir.sqf";

respawnDialogActive = false;
closeDialog 0;

sleep 0.1;

while { ((getposATL player) select 2) > 1 } do {
	hintSilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];
	sleep 0.1;
};

2 cutText ["", "PLAIN DOWN", 1];
hintSilent "";
