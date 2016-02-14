//	@file Version: 1.0
//	@file Name: checkAdmin.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19

private["_uid", "_handle"];

_uid = getPlayerUID player;

if((_uid in moderators) || (_uid in administrators) || (_uid in serverAdministrators)) then {
    closeDialog 0;

    if((_uid in moderators)) then {
        execVM "client\systems\adminPanel\loadModeratorMenu.sqf";
    };

    if((_uid in administrators)) then {
        execVM "client\systems\adminPanel\loadAdministratorMenu.sqf";
    };

    if((_uid in serverAdministrators)) then {
        execVM "client\systems\adminPanel\loadServerAdministratorMenu.sqf";
    };
}
else {
    sleep 1;

    _handle = player execVM "client\systems\adminPanel\checkAdmin2.sqf";

    waitUntil { scriptDone _handle };
};
