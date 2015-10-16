//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat, [404] costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_player", "_killer"];

_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;

closeDialog 0;

PlayerCDeath = [_player, _killer];
publicVariable "PlayerCDeath";

if (isServer) then {
	_id = PlayerCDeath spawn serverPlayerDied;
};

if(!local _player) exitwith { };

if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	}
	else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};

if(isNull(pvar_PlayerTeamKiller) && (_player == _killer)) then {
	_vehiclesNear = nearestObjects [_player, ["Car", "Tank"], 10];
	if(count _vehiclesNear > 0) then {
		_vehicle = _vehiclesNear select 0;
		_driver = driver _vehicle;
		if((side _driver) != Resistance) then {
			if(speed _vehicle > 0 && !isNull _driver && {isPlayer _driver} && {side group _driver == side group _player}) then {
				pvar_playerTeamKiller = _driver;
			};
		};
	};
};

if(!isNull(pvar_PlayerTeamKiller)) then {
	publicVar_teamkillMessage = pvar_PlayerTeamKiller;
	publicVariable "publicVar_teamkillMessage";
};

if((_player getVariable "medkits") > 0) then {
	for "_i" from 1 to (_player getVariable "medkits") do {
		_newObject = "CZ_VestPouch_EP1" createVehicle (position _player);
		_newObject setVariable["R3F_LOG_disabled", true];
		_newObject setVariable["owner", getPlayerUID player, true];
		_newObject setVariable["creationTime", time, true];
	};
};

if((_player getVariable "repairkits") > 0) then {
	for "_i" from 1 to (_player getVariable "repairkits") do {
		_newObject = "Suitcase" createVehicle (position _player);
		_newObject setVariable["R3F_LOG_disabled", true];
		_newObject setVariable["owner", getPlayerUID player, true];
		_newObject setVariable["creationTime", time, true];
	};
};

if((_player getVariable "camonet") > 0) then {
	for "_i" from 1 to (_player getVariable "camonet") do {
		_newObject = "CZ_Backpack_EP1" createVehicle (position _player);
		_newObject setVariable["R3F_LOG_disabled", true];
		_newObject setVariable["owner", getPlayerUID player, true];
		_newObject setVariable["creationTime", time, true];
	};
};

if((_player getVariable "spawnBeacon") > 0) then {
	for "_i" from 1 to (_player getVariable "spawnBeacon") do {
		_newObject = "Satelit" createVehicle (position _player);
		_newObject setVariable["R3F_LOG_disabled", true];
		_newObject setVariable["owner", getPlayerUID player, true];
		_newObject setVariable["creationTime", time, true];
	};
};

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["", "BLACK OUT", 1];
};
