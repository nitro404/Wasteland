//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "dialog\serverAdminMenuDefines.sqf"
#include "dialog\modMenuDefines.sqf"
#include "dialog\debugMenuDefines.sqf"
#include "dialog\adminMenuDefines.sqf"

disableSerialization;

private["_displayAdmin", "_displayMod", "_displayServerAdmin", "_displayDebug", "_modSelect", "_adminSelect", "_serverAdminSelect", "_debugSelect"];

_uid = getPlayerUID player;

if((_uid in moderators) || (_uid in administrators) || (_uid in serverAdministrators)) then {
	_displayAdmin = uiNamespace getVariable "AdminMenu";
	_displayMod = uiNamespace getVariable "ModMenu";
	_displayServerAdmin = uiNamespace getVariable "ServerAdminMenu";
	_displayDebug = uiNamespace getVariable "DebugMenu";

	if(!isNil {_displayMod}) then {
		_modSelect = _displayMod displayCtrl modMenu_option;
	};
	if(!isNil {_displayAdmin}) then {
		_adminSelect = _displayAdmin displayCtrl adminMenu_option;
	};
	if(!isNil {_displayServerAdmin}) then {
		_serverAdminSelect = _displayServerAdmin displayCtrl serverAdminMenu_option;
	};
	if(!isNil {_displayDebug}) then {
		_debugSelect = _displayDebug displayCtrl debugMenu_option;
	};

	switch(_this) do {

		// Moderator Panel
		case 0: {
			switch(lbCurSel _modSelect) do
			{
				// Player Menu
				case 0: {
					closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};

				//Basic Vehicle Menu
				case 1: {
					closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
			};
		};

		// Administrator Panel
		case 1: {
			switch(lbCurSel _adminSelect) do {

				// Player Menu
				case 0: {
					closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};

				// Full Vehicle Management
				case 1: {
					closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
			};
		};

		// Server Administrator Panel
		case 2: {
			switch(lbCurSel _serverAdminSelect) do {
				// Player Menu
				case 0: {
					closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};

				// Full Vehicle Management
				case 1: {
					closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
			};
		};
	};
};
