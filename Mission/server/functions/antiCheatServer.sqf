//	@file Version: 1.0
//	@file Name: antiCheatServer.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

if(!X_Server) exitWith { };

while { true } do {

    {
        _x enableSimulation true;
        _x hideObject false;
        [nil, _x, "loc", rHideObject, false] call RE;

	} forEach playableUnits;

    sleep 10;
};
