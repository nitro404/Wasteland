
//	@file Version: 1.0
//	@file Name: itemfnc.sqf
//  @file Author: [404] Costlyy, [404] Deadbeat
//	@file Created: 01/01/1970 00:00
//	@file Args: [int (0 = use | 1 = drop)]

#include "dialog\player_sys.sqf";

#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})

if(isNil {dropActive}) then {dropActive = false};

disableSerialization;

private["_switch","_data","_vehicle_type","_pos"];

_switch = _this select 0;
_data = GET_SELECTED_DATA(item_list);

switch(_switch) do {
	// Use item
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
	//Drop item
	case 1: {
		if(_data == "") exitWith {
        		player globalChat "YOU NEED TO SELECT AN ITEM TO DROP!";
        	};

		if(vehicle player != player) exitwith {
        		player globalChat "YOU ARE CURRENTLY BUSY!";
       		};

		_pos = getPosATL player;

		//Drops the item and sets values & variables
		switch(_data) do {
			case "fuelFull": {
				player setVariable["fuelFull", (player getVariable "fuelFull")-1, true];
				_temp = "Fuel_can" createVehicle (position player);
				_temp setVariable["fuel", true, true];
				_temp setPos _pos;
				_temp setVariable["R3F_LOG_disabled", true];
			};
			case "fuelEmpty": {
				player setVariable["fuelEmpty", (player getVariable "fuelEmpty")-1, true];
				_temp = "Fuel_can" createVehicle (position player);
				_temp setVariable["fuel", false, true];
				_temp setPos _pos;
				_temp setVariable["R3F_LOG_disabled", true];
			};
			case "repairkits": {
				player setVariable["repairkits", (player getVariable "repairkits")-1, true];
				_temp = "Suitcase" createVehicle (position player);
				_temp setPos _pos;
				_temp setVariable["R3F_LOG_disabled", true];
			};
			case "medkit": {
				player setVariable["medkits", (player getVariable "medkits")-1, true];
				_temp = "CZ_VestPouch_EP1" createVehicle (position player);
				_temp setPos _pos;
				_temp setVariable["R3F_LOG_disabled", true];
			};
			case "camonet": {
				player setVariable["camonet", (player getVariable "camonet")-1, true];
				_temp = "CZ_Backpack_EP1" createVehicle (position player);
				_temp setPos _pos;
				_temp setVariable["R3F_LOG_disabled", true];
			};
			case "spawnBeacon": {
				player setVariable["spawnBeacon", (player getVariable "spawnBeacon")-1,true];
				_droppedBeacon = "Satelit" createVehicle (position player);
				_droppedBeacon setVariable["spawnsRemaining", 100, true];
				_droppedBeacon setVariable["faction","WORLD",true];
				_droppedBeacon setVariable["R3F_LOG_disabled", true];
	    		};
		};

	        closeDialog 0; // To fix the listbox not updating properly.
	};
};