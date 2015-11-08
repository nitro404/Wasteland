//	@file Version: 1.0
//	@file Name: playerSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "dialog\playerMenuDefines.sqf"

disableSerialization;

private["_dialog", "_playerListBox", "_spectateButton", "_switch", "_index", "_modSelect", "_playerData", "_target", "_check", "_spectating", "_camadm", "_rnum", "_warnText", "_targetUID", "_playerName"];

_uid = getPlayerUID player;

if((_uid in moderators) || (_uid in administrators) || (_uid in serverAdministrators)) then {
	_dialog = findDisplay playerMenuDialog;
	_playerListBox = _dialog displayCtrl playerMenuPlayerList;
	_spectateButton = _dialog displayCtrl playerMenuSpectateButton;
	_warnMessage = _dialog displayCtrl playerMenuWarnMessage;

	_switch = _this select 0;
	_index = lbCurSel _playerListBox;
	_playerData = _playerListBox lbData _index;

	{
		if(str(_x) == _playerData) then {
			_target = _x;
			_check = 1;
		};
	} forEach playableUnits;

	if(_check == 0) exitWith { };

	switch(_switch) do {
		// Spectate
		case 0: {
			_spectating = ctrlText _spectateButton;

			if(_spectating == "Spectate") then {
				_spectateButton ctrlSetText "Spectating";
				player commandChat format ["Viewing %1.", name _target];

				camDestroy _camadm;
				_camadm = "camera" camCreate ([(position vehicle _target select 0) - 5,(position vehicle _target select 1), (position vehicle _target select 2) + 10]);
				_camadm cameraEffect ["external", "TOP"];
				_camadm camSetTarget (vehicle _target);
				_camadm camCommit 1;

				_rnum = 0;

				while { ctrlText _spectateButton == "Spectating" } do {
					switch(_rnum) do {
						if(daytime > 19 || daytime < 5) then { camUseNVG true; } else { camUseNVG false; };
						case 0: { detach _camadm; _camadm attachTo [(vehicle _target), [0,-10,4]]; _camadm setVectorUp [0, 1, 5] ;};
						case 1: { detach _camadm; _camadm attachTo [(vehicle _target), [0,10,4]]; _camadm setDir 180; _camadm setVectorUp [0, 1, -5]; };
						case 2: { detach _camadm; _camadm attachTo [(vehicle _target), [0,1,50]]; _camadm setVectorUp [0, 50, 1]; };
						case 3: { detach _camadm; _camadm attachTo [(vehicle _target), [-10,0,2]]; _camadm setDir 90; _camadm setVectorUp [0, 1, 5]; };
						case 4: { detach _camadm; _camadm attachTo [(vehicle _target), [10,0,2]]; _camadm setDir -90; _camadm setVectorUp [0, 1, -5]; };
					};

					player commandChat "Viewing cam " + str(_rnum) + " on " + str(name vehicle _target);
					_rnum = _rnum + 1;
					if(_rnum > 4) then { _rnum = 0; };

					sleep 5;
				};
			}
			else {
				_spectateButton ctrlSetText "Spectate";
				player commandchat format ["No Longer Viewing.", name _target];
				player cameraEffect ["terminate","back"];
				camDestroy _camadm;
			};
		};

		// Warn
		case 1: {
			_warnText = ctrlText _warnMessage;
			_playerName = name player;
			_target setVehicleInit format["if (name player == ""%2"") then {titleText [""Admin %3: %1"", ""plain""]; titleFadeOut 10;};",_warnText,name _target,_playerName];
			processInitCommands;
			clearVehicleInit _target;
		};

		// Slay
		case 2: {
			_target setVehicleInit format["if (name player == ""%1"") then {player setdamage 1;deletevehicle player;};",name _target];
			processInitCommands;
			clearVehicleInit _target;
		};

		// Unlock Team Switcher
		case 3: {
			_targetUID = getPlayerUID _target;
			{
				if(_x select 0 == _targetUID) then {
					pvar_teamSwitchList set [_forEachIndex, objNull];
					pvar_teamSwitchList = pvar_teamSwitchList - [objNull];
					publicVariableServer "pvar_teamSwitchList";

					_target setVehicleInit format["if (name player == ""%1"") then { firstSpawn = true; };", name _target];
					processInitCommands;
					clearVehicleInit _target;

					player setVehicleInit format["if isServer then { publicVariable 'pvar_teamSwitchList'; };"];
					processInitCommands;
					clearVehicleInit player;
				};
			} forEach pvar_teamSwitchList;
		};

		// Unlock Team Killer
		case 4: {
			_targetUID = getPlayerUID _target;

			{
				if(_x select 0 == _targetUID) then {
					pvar_teamKillList set [_forEachIndex, objNull];
					pvar_teamKillList = pvar_teamKillList - [objNull];
					publicVariableServer "pvar_teamKillList";

					player setVehicleInit format["if isServer then {publicVariable 'pvar_teamKillList';};"];
					processInitCommands;
					clearVehicleInit player;
				};
			} forEach pvar_teamKillList;
	    	};

		// Remove All Money
		case 5:  {
			_targetUID = getPlayerUID _target;

			{
				if(getPlayerUID _x == _targetUID) then {
					_x setVariable["money", 0, true];
				};
			} forEach playableUnits;
		};

		//Remove All Weapons
		case 6: {
			_targetUID = getPlayerUID _target;

			{
				if(getPlayerUID _x == _targetUID) then {
					if(!(local _x)) then {
						[nil, _x, "loc", rSPAWN, [_x], { removeAllWeapons (_this select 0) }] call RE;
					}
					else {
						removeAllWeapons _x;
					};
				};
			} forEach playableUnits;
		};

		// Check Player Gear
		case 7:
		{
			_targetUID = getPlayerUID _target;

			{
				if(getPlayerUID _x == _targetUID) then {
					createGearDialog [_x, "RscDisplayGear"];
				};
			} forEach playableUnits;
		};
	};
};
