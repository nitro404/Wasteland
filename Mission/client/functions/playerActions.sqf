
//	@file Version: 1.1
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//  @file Modified: 07/12/2012 23:35
//	@file Args:

playerActions = [];

playerActions = playerActions + [player addAction["Take Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"], 5] select 0); player setVariable["fuelFull", 1, true]; hint "You have taken a fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Fuel_can"],  5] > 0 && ((player getVariable "fuelFull") == 0) && ((player getVariable "fuelEmpty") == 0) AND ((nearestObjects [player, ["Fuel_can"], 5] select 0) getVariable "fuel")']];

playerActions = playerActions + [player addAction["Take Empty Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelEmpty", 1, true]; hint "You have taken a empty fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Fuel_can"],  5] > 0 && ((player getVariable "fuelFull") == 0) && ((player getVariable "fuelEmpty") == 0) && !((nearestObjects [player, ["Fuel_can"], 5] select 0) getVariable ["fuel", false])']];

playerActions = playerActions + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", 'count nearestobjects [player, ["Land_Fuel_tank_big", "Land_fuel_tank_small", "Land_A_FuelStation_Feed", "Land_Ind_TankSmall", "Land_Ind_TankSmall2", "Land_Ind_TankSmall2_EP1", "Land_Ind_FuelStation_Feed_Ep1", "Land_Fuel_tank_stairs"], 5] > 0 && ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];

playerActions = playerActions + [player addAction["Take Repair kit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Suitcase"], 5] select 0); player setVariable["repairkits", (player getVariable "repairkits") + 1, true]; hint "You have taken a repair kit."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Suitcase"], 5] > 0 && (player getVariable "repairkits") < 2']];

playerActions = playerActions + [player addAction["Take Medkit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_VestPouch_EP1"], 5] select 0); player setVariable["medkits", (player getVariable "medkits") + 1, true]; hint "You have taken a medkit."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["CZ_VestPouch_EP1"], 5] > 0 && (player getVariable "medkits") < 2']];

playerActions = playerActions + [player addAction["Take Camo Net", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_Backpack_EP1"], 5] select 0); player setVariable["camonet", (player getVariable "camonet") + 1, true]; hint "You have taken a camo net."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["CZ_Backpack_EP1"], 5] > 0 && (player getVariable "camonet") < 2']];

playerActions = playerActions + [player addAction["Take Spawn Beacon", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Satelit"], 5] select 0); player setVariable["spawnBeacon", (player getVariable "spawnBeacon") + 1, true]; hint "You have taken a spawn beacon."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Satelit"], 5] > 0 && (player getVariable "spawnBeacon") < 1 and isNil {(nearestobjects [player, ["Satelit"], 5] select 0) getVariable "ownerName"}']];

playerActions = playerActions + [player addAction["Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", 'count nearestobjects [player, ["EvMoney"],  5] > 0']];

playerActions = playerActions + [player addAction[("<t color=""#E01B1B"">Destroy Spawn Beacon</t>"), "client\actions\pickupBeacon.sqf", 1, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"], 5]) select 0; (_currBeacon getVariable "ownerUID") == (getPlayerUID player) || str(playerSide) == "GUER" || str(playerSide) != (_currBeacon getVariable "faction") || (_currBeacon getVariable "faction") == "WORLD"']];

playerActions = playerActions + [player addAction[("<t color=""#21DE31"">Repack Spawn Beacon</t>"), "client\actions\pickupBeacon.sqf", 0, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"], 5]) select 0; (_currBeacon getVariable "ownerUID") == (getPlayerUID player) || str(playerSide) == "GUER" || str(playerSide) != (_currBeacon getVariable "faction") || (_currBeacon getVariable "faction") == "WORLD"']];

playerActions = playerActions + [player addAction["Pickup Camo Net", "client\actions\pickupcamonet.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_CamoNet_NATO"],  5] select 0) < 5 and (player getVariable "camonet")<1 ']];

playerActions = playerActions + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 7, false, false, "", 'mutexScriptInProgress']];
