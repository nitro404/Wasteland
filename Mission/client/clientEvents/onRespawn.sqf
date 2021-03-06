//	@file Version: 1.0
//	@file Name: onRespawn.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

playerSetupComplete = false;

{
	_this select 1 removeAction _x;
} forEach playerActions;

call playerSetup;

waitUntil { playerSetupComplete };

execVM "client\clientEvents\onMouseWheel.sqf";

true spawn playerSpawn;

[] spawn {
	waitUntil { respawnDialogActive };
	waitUntil { sleep 0.1; !respawnDialogActive };

	if(!isNull playerTeamKiller) then {
		pDialogTeamkiller = playerTeamKiller;
		playerTeamKiller = objNull;

		execVM "client\functions\createTeamKillDialog.sqf";
	};
};
