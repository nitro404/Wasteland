
//	@file Version: 1.1
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//  @file Modified: 07/12/2012 23:35
//	@file Args:

aActionsIDs = [];

//Fuel can actions.
aActionsIDs = aActionsIDs + [player addAction["Take Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelFull",1,true]; hint "You have taken a fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Fuel_can"],  5] select 0) < 4 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 0) AND ((nearestObjects[player, ["Fuel_can"], 3] select 0) getVariable "fuel")']];
aActionsIDs = aActionsIDs + [player addAction["Take Empty Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelEmpty",1,true]; hint "You have taken a empty fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Fuel_can"],  5] select 0) < 4 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 0) AND !((nearestObjects[player, ["Fuel_can"], 3] select 0) getVariable ["fuel", false])']];
aActionsIDs = aActionsIDs + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_A_FuelStation_Feed", "BarrelBase", "Land_Ind_FuelStation_Feed_Ep1"],  3] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];

aActionsIDs = aActionsIDs + [player addAction["Take Repair kit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Suitcase"],  5] select 0); player setVariable["repairkits", (player getVariable "repairkits")+1,true]; hint "You have taken a repair kit."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Suitcase"],  5] select 0) < 4 and (player getVariable "repairkits")<2']];
aActionsIDs = aActionsIDs + [player addAction["Take Medkit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_VestPouch_EP1"],  5] select 0); player setVariable["medkits", (player getVariable "medkits")+1,true]; hint "You have taken a medkit."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["CZ_VestPouch_EP1"],  5] select 0) < 4 and (player getVariable "medkits")<2 ']];
aActionsIDs = aActionsIDs + [player addAction["Take Camo Net", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_Backpack_EP1"],  5] select 0); player setVariable["camonet", (player getVariable "camonet")+1,true]; hint "You have taken a camo net."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["CZ_Backpack_EP1"],  5] select 0) < 4 and (player getVariable "camonet")<2 ']];
aActionsIDs = aActionsIDs + [player addAction["Take Spawn Beacon", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Satelit"],  5] select 0); player setVariable["spawnBeacon", (player getVariable "spawnBeacon")+1,true]; hint "You have taken a spawn beacon."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Satelit"],  5] select 0) < 4 and (player getVariable "spawnBeacon")<1 and isNil {(nearestobjects [player, ["Satelit"],  5] select 0) getVariable "ownerName"}']];

//Pickup Money
aActionsIDs = aActionsIDs + [player addAction["Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["EvMoney"],  5] select 0) < 5']];

//Pickup SpawnBeacon (Satelit)
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#E01B1B"">Destroy spawn beacon</t>"), "client\actions\pickupBeacon.sqf", 1, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"],  5]); player distance (_currBeacon select 0) < 5; ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "ownerUID") == (getPlayerUID player) OR str(playerSide) == "GUER" OR str(playerSide) != ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") OR ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") == "WORLD"']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Repack spawn beacon</t>"), "client\actions\pickupBeacon.sqf", 0, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"],  5]); player distance (_currBeacon select 0) < 5; ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "ownerUID") == (getPlayerUID player) OR str(playerSide) == "GUER" OR str(playerSide) != ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") OR ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") == "WORLD"']];

//Interact with radar trucks
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Deploy radar</t>"), "client\functions\radarDeploy.sqf",nil, 6, false, false, "", '_currRadar = (nearestobjects [player, ["M1133_MEV_EP1"],  5]); player distance (_currRadar select 0) < 5; ((nearestObjects[player, ["M1133_MEV_EP1"], 10] select 0) getVariable "deployed") == 0 AND str(playerSide) != "GUER"']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#E01B1B"">Repack radar</t>"), "client\functions\radarPack.sqf", nil, 6, false, false, "", '_currRadar = (nearestobjects [player, ["M1130_HQ_unfolded_Base_EP1"],  5]); player distance (_currRadar select 0) < 5; ((nearestObjects[player, ["M1130_HQ_unfolded_Base_EP1"], 10] select 0) getVariable "deployed") == 1 AND str(playerSide) != "GUER"']];

//Camonet pickup
aActionsIDs = aActionsIDs + [player addAction["Pickup Camo Net", "client\actions\pickupcamonet.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_CamoNet_NATO"],  5] select 0) < 5 and (player getVariable "camonet")<1 ']];

//Cancel action
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 7, false, false, "", 'mutexScriptInProgress']];
