//	@file Version: 1.0
//	@file Name: spawnAction.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args: [int(type of spawn)]

private["_switch", "_button", "_side", "_startTime", "_result", "_found", "_currTime"];

_switch = _this select 0;
_button = _this select 1;

_playerSpawning = false;

if(!isNil "playerSpawning") then {
	_playerSpawning = playerSpawning;
};

if(_playerSpawning) exitWith { };

playerSpawning = true;

switch(_switch) do {
	case 0: {
		execVM "client\functions\spawnRandomGround.sqf"
	};
	case 1: {
		if(showBeacons) then {
			[_button] execVM "client\functions\spawnOnBeacon.sqf"
		}
		else {
			[_button] execVM "client\functions\spawnInTown.sqf"
		};
	};
	case 2: {
		execVM "client\functions\spawnRandomHALO.sqf"
	};
};

playerSpawning = false;

player selectWeapon secondaryWeapon player;

if(isNil "firstSpawn") then {
	firstSpawn = true;
};

if(firstSpawn) then {
	firstSpawn = false;

	[] execVM "client\functions\welcomeMessage.sqf";

	true spawn {
		_startTime = floor(time);
		_result = 0;

		waitUntil {
			_currTime = floor(time);

			if(_currTime - _startTime >= 200) then {
				_result = 1;
			};

			(_result == 1)
		};

		if(playerSide in [west, east]) then {
			_found = false;

			{
				if(_x select 0 == getPlayerUID player) then {
					_found = true;
				};
			} forEach pvar_teamSwitchList;

			if(!_found) then {
				pvar_teamSwitchList set [count pvar_teamSwitchList, [getPlayerUID player, playerSide]];
				publicVariable "pvar_teamSwitchList";

				_side = "";

				if(playerSide == west) then {
					_side = "Blufor";
				};

				if(playerSide == east) then {
					_side = "Opfor";
				};

				titleText [format["You have been locked to %1", _side], "PLAIN", 0];
			};
		};
	};
};
