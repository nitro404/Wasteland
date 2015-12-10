//	@file Version: 1.0
//	@file Name: updateTeamKiller.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

if(side group player == east || side group player == west) then {
	{
		if(_x select 0 == getPlayerUID player) then {
			if((_x select 1) >= 2) then {
				titleText ["", "BLACK IN", 0];
				titleText [localize "STR_WL_Loading_Teamkiller", "black"];
				titleFadeOut 9999;

				removeAllWeapons player;

				[] spawn {
					sleep 20;
					endMission "LOSER";
				};
			};
		};
	} forEach teamKillList;
};
