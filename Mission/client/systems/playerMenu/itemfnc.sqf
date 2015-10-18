
//	@file Version: 1.0
//	@file Name: itemfnc.sqf
//  @file Author: [404] Costlyy, [404] Deadbeat
//	@file Created: 01/01/1970 00:00
//	@file Args: [int (0 = use | 1 = drop)]

#include "dialog\player_sys.sqf";

#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0; _selection = (lbSelection GET_CTRL(_idc) select 0); if(isNil {_selection}) then {_selection = 0}; (GET_CTRL(_idc) lbData _selection)})

private["_switch", "_data", "_item", "_vehicle_type", "_pos"];

disableSerialization;

_switch = _this select 0;
_data = GET_SELECTED_DATA(item_list);

switch(_switch) do {
	case 0: {
		closeDialog 0;

		switch(_data) do {
			case "fuelFull": {
				[] call refuelVehicle;
			};
			case "fuelEmpty": {
				hint "You can refuel Fuel Can at gas station through action menu";
			};
			case "repairkits": {
				[] call repairVehicle;
			};
			case "medkit": {
               			[] call useMedicalKit;
			};
			case "camonet": {
				[] call placeCamoNet;
			};
			case "spawnBeacon": {
				[] call placeSpawnBeacon;
			};
		};
	};
	case 1: {
		if(_data == "") exitWith {
        		player globalChat "YOU NEED TO SELECT AN ITEM TO DROP!";
        	};

		if(vehicle player != player) exitwith {
        		player globalChat "YOU ARE CURRENTLY BUSY!";
       		};

		switch(_data) do {
			case "fuelFull": {
				player setVariable["fuelFull", (player getVariable "fuelFull") - 1, true];
				_item = "Fuel_can" createVehicle (position player);
				_item setPos (getPosATL player);
				_item setVariable["R3F_LOG_disabled", true];
				_item setVariable["owner", getPlayerUID player, true];
				_item setVariable["creationTime", time, true];
			};
			case "fuelEmpty": {
				player setVariable["fuelEmpty", (player getVariable "fuelEmpty") - 1, true];
				_item = "Fuel_can" createVehicle (position player);
				_item setPos (getPosATL player);
				_item setVariable["R3F_LOG_disabled", true];
				_item setVariable["owner", getPlayerUID player, true];
				_item setVariable["creationTime", time, true];
			};
			case "repairkits": {
				player setVariable["repairkits", (player getVariable "repairkits") - 1, true];
				_item = "Suitcase" createVehicle (position player);
				_item setPos (getPosATL player);
				_item setVariable["R3F_LOG_disabled", true];
				_item setVariable["owner", getPlayerUID player, true];
				_item setVariable["creationTime", time, true];
			};
			case "medkit": {
				player setVariable["medkits", (player getVariable "medkits") - 1, true];
				_item = "CZ_VestPouch_EP1" createVehicle (position player);
				_item setPos (getPosATL player);
				_item setVariable["R3F_LOG_disabled", true];
				_item setVariable["owner", getPlayerUID player, true];
				_item setVariable["creationTime", time, true];
			};
			case "camonet": {
				player setVariable["camonet", (player getVariable "camonet") - 1, true];
				_item = "CZ_Backpack_EP1" createVehicle (position player);
				_item setPos (getPosATL player);
				_item setVariable["R3F_LOG_disabled", true];
				_item setVariable["owner", getPlayerUID player, true];
				_item setVariable["creationTime", time, true];
			};
			case "spawnBeacon": {
				player setVariable["spawnBeacon", (player getVariable "spawnBeacon")-1,true];
				_item = "Satelit" createVehicle (position player);
				_item setVariable["spawnsRemaining", 100, true];
				_item setVariable["faction", "WORLD", true];
				_item setVariable["R3F_LOG_disabled", true];
				_item setVariable["owner", getPlayerUID player, true];
				_item setVariable["creationTime", time, true];
	    		};
		};

	        closeDialog 0;
	};
};
