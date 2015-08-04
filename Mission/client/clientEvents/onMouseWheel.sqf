//	@file Version: 1.0
//	@file Name: onMouseWheel.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

if(!isNil "playerMenuHandle") then {
	terminate playerMenuHandle;
};

playerMenuHandle = [] spawn {
	waituntil { !isnull player };

	private ["_veh"];

	while { true } do {

		waituntil { vehicle player == player };

		if(!isnil "_veh") then {
			_veh removeaction playerMenuId;
			_veh removeaction vehicleHALOJumpID;
		};

		playerMenuId = player addAction ["<t color='#BE6300'>Player Menu</t>", "client\systems\playerMenu\init.sqf", [], -10, false, true, "", "local player"];

		waituntil { vehicle player != player };

		player removeaction playerMenuId;
		_veh = vehicle player;

		playerMenuId = _veh addAction ["<t color='#BE6300'>Player Menu</t>", "client\systems\playerMenu\init.sqf", [], -10, false, true, "", "local player"];

		vehicleHALOJumpID = _veh addAction["<t color=""#0099FF"">HALO Jump</t>", "client\functions\vehicleHALOJump.sqf", [], -11, false, true, "", "(getPosATL player select 2) > 25"];
	};
};
