//	@file Version: 1.0
//	@file Name: playerSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_playerUID", "_kickTeamKiller", "_kickTeamSwitcher", "_side"];

_playerUID = getPlayerUID player;
_kickTeamKiller = false;
_kickTeamSwitcher = false;

if(!((_playerUID in moderators) || (_playerUID in administrators) || (_playerUID in serverAdministrators))) then {
	{
		if(_x select 0 == _playerUID) then {
			if(playerSide != (_x select 1) && str(playerSide) != "GUER") then {
				_kickTeamSwitcher = true;
				_side = str(_x select 1);
			};
		};
	} forEach pvar_teamSwitchList;

	if(_kickTeamSwitcher) exitWith {
		titleText ["", "BLACK IN", 0];
		titleText [format[localize "STR_WL_Loading_Teamswitched", localize format ["STR_WL_Gen_Team%1_2", _side]], "black"];
		titleFadeOut 9999;

		[] spawn {
			sleep 20;
			endMission "LOSER";
		};
	};
};

{
	if(_x select 0 == _playerUID) then {
		if((_x select 1) >= 2) then {
			if(playerSide in [west, east]) then {
				_kickTeamKiller = true;
			};
		};
	};
} forEach pvar_teamKillList;

if(_kickTeamKiller) exitWith {
	titleText ["", "BLACK IN", 0];
	titleText [localize "STR_WL_Loading_Teamkiller", "black"];
	titleFadeOut 9999;

	[] spawn {
		sleep 20;
		endMission "LOSER";
	};
};

player setPos [-20000 - (random 10000), 5000 + random 15000, 0];

true spawn client_respawnDialog;

waitUntil { respawnDialogActive };

while { respawnDialogActive } do {
	titleText ["", "BLACK OUT", 0.00001];
};

titleText ["", "BLACK IN", 0.00001];

player enableSimulation true;
