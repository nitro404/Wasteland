//	@file Version: 1.0
//	@file Name: antiCheatServer.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

if(!X_Server) exitWith {};

_instantKick = false; // Kick the nasty little scalliwags immediately or taunt them a little?

while {true} do {
    //Iterate through the playable object and set some values.
    {
        // Re-enable input incase it has been disabled.
        _x enableSimulation true;

        // Show the player incase they are trying to be a sneaky little neckbearded fuck.
        _x hideObject false;
        [nil, _x, "loc", rHideObject, false] call RE;

	} forEach playableUnits;

	// Don't loop too fast, with 60+ people connected this might be quite straining.
    sleep 10;
};
