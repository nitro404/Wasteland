//	@file Version: 1.0
//	@file Name: onRespawn.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_corpse"];

playerSetupComplete = false;

_corpse = (_this select 0) select 1;
{
	_corpse removeAction _x;
} forEach playerActions;

player call playerSetup;
waitUntil { playerSetupComplete };

[] execVM "client\clientEvents\onMouseWheel.sqf";

true spawn playerSpawn;

[] spawn {
	waitUntil { respawnDialogActive };
	waitUntil { sleep 0.1; !respawnDialogActive };

	if(!isNull pvar_PlayerTeamKiller) then {
		pDialogTeamkiller = pvar_PlayerTeamKiller;
		pvar_PlayerTeamKiller = objNull;

		[] execVM "client\functions\createTeamKillDialog.sqf";
	};
};
