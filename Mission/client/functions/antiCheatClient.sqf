//	@file Version: 1.0
//	@file Name: antiCheatClient.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

// This anti-cheat file is a a work-in-progress and is not intended to replace vigilance and or anticheat software.
// The reason that I wrote this file is to mitigate some of the most irritating but not server destroying hacks that
// players complain about the most.

// I couldn't figure out a way to extract all weapons of superClass "cannonBase" and as a result, we have this ugly monstrosity below.
// TODO: Find a better way of doing this...
_bannedWeapons = [
    "GRAD","HellfireLauncher","HellfireLauncher_AH6","VikhrLauncher"
];

// TODO: Make mission vehicles sit in public arrays, then extrapolate the vehicles out of the cfgVehicles in full
//  and just compare to make sure the selected vehicle is not in any of the mission arrays.
_bannedVehicles = [
	"F35B","F35","A10","A10_US_EP1","AH64D_EP1","AV8B","AV8B2","Su25_CDF","Su25_Ins","Su25_TK_EP1","Su39","Su34",
    "L39_2_ACR","L39_ACR",
    "AH1Z","AH64D","AH64D_Sidewinders","BAF_Apache_AH1_D","Ka52","Ka52Black",
    "CruiseMissile1","CruiseMissile2","MLRS"
];

_instantKick = false; // Kick the bastards immediately or taunght them a little?

func_tauntHacker = {
	// Black their screen out and taunt them with silly messages! Mwahahahaha!
	titleText ["", "BLACK IN", 0];
	titleText ["ERROR: User performed an illegal operation. \n\n If the problem persists, contact your system administrator or stop using hacked items.","black"];
	sleep 10; titleFadeOut 10;
};

while {true} do {
	// Re-enable input incase it has been disabled.
	player enableSimulation true;
    disableUserInput false;

	// Show the player incase they are trying to be a sneaky little neckbearded fuck.
	player hideObject false;
	[nil, player, "loc", rHideObject, false] call RE;

    // Remove existing event handlers before adding them back.
    player removeAllEventHandlers "Killed";
    player removeAllEventHandlers "Respawn";
    player removeAllEventHandlers "handleDamage";

    // Add event handlers back incase hacker has disabled them.
    if(!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH]; };
	player addEventHandler ["Respawn", {[_this] call onRespawn;}];
	player addEventHandler ["Killed", {[_this] call onKilled;}];
    player addEventHandler ["handleDamage", { _this select 2 }];
    player allowDamage true;

    { // Check for illegal weapons.
    	if (currentWeapon player == _x) exitWith {
        	// Firstly MITIGATE the damage by removing the infringing weaponry.
    		removeAllWeapons player;
            if (!_instantKick) then { [] call func_tauntHacker; };
            endMission "LOSER";
        };
    }forEach _bannedWeapons;

    { // Check for illegal vehicles.
    	if ((typeOf (vehicle player)) == _x) then {
        	deleteVehicle (vehicle player);
            playSound "IncomingChallenge";
        	[] call func_tauntHacker;
        };
    }forEach _bannedVehicles;

	// Loop speed not much of an issue clientside.
	sleep 0.5;
};
