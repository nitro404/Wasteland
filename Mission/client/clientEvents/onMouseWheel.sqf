//	@file Version: 1.0
//	@file Name: onMouseWheel.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:


if(!isNil "playerMenuHandle") then {
	terminate playerMenuHandle;
};

playerMenuHandle = [] spawn {
	private ["_vehicle", "_playerMenuID", "_vehicleHALOJumpID"];

	waitUntil { !isNull player };

	while { true } do {
		waitUntil { sleep 0.5; vehicle player == player };

		if(!isNil "_vehicle") then {
			_vehicle removeAction _playerMenuID;
			_vehicle removeAction _vehicleHALOJumpID;
		};

		waitUntil { sleep 0.5; vehicle player != player };

		_vehicle = vehicle player;

		_playerMenuID = _vehicle addAction["<t color='#BE6300'>Player Menu</t>", "client\systems\playerMenu\init.sqf", [], -10, false, true, "", "local player"];

		_vehicleHALOJumpID = _vehicle addAction["<t color=""#0099FF"">HALO Jump</t>", "client\functions\vehicleHALOJump.sqf", [], -11, false, true, "", "getPosATL player select 2 > 25"];
	};
};
