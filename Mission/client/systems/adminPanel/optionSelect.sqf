//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define serverAdminMenu_option 50007
#define modMenu_option 50005
#define debugMenu_option 50003
#define adminMenu_option 50001

disableSerialization;

private ["_panelType","_displayAdmin","_displayMod","_displayServerAdmin","_displayDebug","_modSelect","_adminSelect","_serverAdminSelect","_debugSelect"];

_uid = getPlayerUID player;

if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
	_panelType = _this select 0;

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

	switch(_panelType) do {

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

				// GCam
				case 2: {
					closeDialog 0;
					execVM "addons\gcam\gcam.sqf";
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

				// Tags
				case 2:{
					execVM "client\systems\adminPanel\playerTags.sqf";
				};

				// GCam
				case 3: {
					closeDialog 0;
					execVM "addons\gcam\gcam.sqf";
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

				// Tags
				case 2: {
					execVM "client\systems\adminPanel\playerTags.sqf";
				};

				// Teleport
				case 3: {
					closeDialog 0;
					hint "Click on map to teleport";
					if(vehicle player isKindOf "Air") then {
						onMapSingleClick "vehicle player setPosATL [_pos select 0, _pos select 1, getPosATL player select 2]; onMapSingleClick ''; true;";
					}
					else {
						onMapSingleClick "vehicle player setPos _pos; onMapSingleClick ''; true;";
					};
					openMap true;
				};

				// Money
				case 4: {
					if(isNil {player getVariable "cmoney"}) then {
						player setVariable["cmoney", 1000, true];
					}
					else {
						player setVariable["cmoney", (player getVariable "cmoney") + 1000, true];
					};
				};

				// GCam
				case 5: {
					closeDialog 0;
					execVM "addons\gcam\gcam.sqf";
				};

				// Debug Menu
				case 6: {
					closeDialog 0;
					execVM "client\systems\adminPanel\loadDebugMenu.sqf";
				};
			};
		};

		// Debug Panel
		case 3: {
			switch (lbCurSel _debugSelect) do {

				// Access Gun Store
				case 0: {
					closeDialog 0;
					execVM "client\systems\gunStore\loadGunStore.sqf";
				};

				// Access General Store
				case 1: {
					closeDialog 0;
					execVM "client\systems\generalStore\loadGenStore.sqf";
				};

				// Access Respawn Dialog
				case 2: {
					closeDialog 0;
					true spawn client_respawnDialog;
				};

				// Access Proving Grounds
				case 3:  {
					closeDialog 0;
					createDialog "balca_debug_main";
				};

				// Restart Function
				case 4: {
					hint format["Server FPS: %1", serverFPS];
				};

				// Spawn Gun Crates
				case 5: {

					_weaponCrateTypes = ["basicUS", "basicUS2", "basicRU", "basicRU2", "basicGER", "basicPMC", "basicSpecial", "basicSpecial2", "basicSpecial3"];
					_playerLocation = getPos player;

					hint format["Spawning %1 Weapon Crates", count _weaponCrateTypes, str _playerLocation];

					{
						_safePosition = [_playerLocation, 1, 5, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
						[_x, _safePosition] execVM "server\spawning\boxCreation.sqf";
					} forEach _weaponCrateTypes;
				};

				// Player Position
				case 6: {
					hint format["Player Position: %1", str getPos player];
				};
			};
		};
	};
}
else {
  exit;
};
