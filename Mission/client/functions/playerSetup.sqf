
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_player", "_startingMoney"];

_startingMoney = 800;

_player = _this;

_player setskill 0;

{
	_player disableAI _x;
} forEach ["move", "anim", "target", "autotarget"];

_player setVariable["BIS_noCoreConversations", true];

enableSentences false;

_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";

removeAllWeapons _player;
removeBackpack _player;

_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addWeapon "glock17_EP1";

_player addWeapon "ItemGPS";
_player addWeapon "Binocular";

_player selectWeapon "glock17_EP1";

_player addrating 1000000;

if(isNil {_player getVariable "money"}) then {
	_player setVariable["money", _startingMoney, false];
}
else {
	if(_player getVariable "money" < _startingMoney) then {
		_player setVariable["money", _startingMoney, false];
	};
};

_player setVariable["medkits", 0, true];
_player setVariable["repairkits", 0, true];
_player setVariable["fuelFull", 1, true];
_player setVariable["fuelEmpty", 0, true];
_player setVariable["spawnBeacon", 0, true];
_player setVariable["ShowNameAllies", false, true];
_player setVariable["camonet", 0, true];

if(isNil {_player getVariable "earplugs"}) then {
	_player setVariable["earplugs", false, false];
};

player addAction["Take Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"], 5] select 0); player setVariable["fuelFull", 1, true]; hint "You have taken a fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Fuel_can"],  5] > 0 && ((player getVariable "fuelFull") == 0) && ((player getVariable "fuelEmpty") == 0) AND ((nearestObjects [player, ["Fuel_can"], 5] select 0) getVariable "fuel")'];

player addAction["Take Empty Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelEmpty", 1, true]; hint "You have taken a empty fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Fuel_can"],  5] > 0 && ((player getVariable "fuelFull") == 0) && ((player getVariable "fuelEmpty") == 0) && !((nearestObjects [player, ["Fuel_can"], 5] select 0) getVariable ["fuel", false])'];

player addAction["Refuel Jerry Can", "client\actions\refuelJerryCan.sqf", [], 1, false, false, "", 'count nearestobjects [player, ["Land_Fuel_tank_big", "Land_fuel_tank_small", "Land_A_FuelStation_Feed", "Land_Ind_TankSmall", "Land_Ind_TankSmall2", "Land_Ind_TankSmall2_EP1", "Land_Ind_FuelStation_Feed_Ep1", "Land_Fuel_tank_stairs"], 5] > 0 && ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)'];

player addAction["Take Repair kit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Suitcase"], 5] select 0); player setVariable["repairkits", (player getVariable "repairkits") + 1, true]; hint "You have taken a repair kit."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Suitcase"], 5] > 0 && (player getVariable "repairkits") < 2'];

player addAction["Take Medkit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_VestPouch_EP1"], 5] select 0); player setVariable["medkits", (player getVariable "medkits") + 1, true]; hint "You have taken a medkit."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["CZ_VestPouch_EP1"], 5] > 0 && (player getVariable "medkits") < 2'];

player addAction["Take Camo Net", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_Backpack_EP1"], 5] select 0); player setVariable["camonet", (player getVariable "camonet") + 1, true]; hint "You have taken a camo net."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["CZ_Backpack_EP1"], 5] > 0 && (player getVariable "camonet") < 2'];

player addAction["Take Spawn Beacon", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Satelit"], 5] select 0); player setVariable["spawnBeacon", (player getVariable "spawnBeacon") + 1, true]; hint "You have taken a spawn beacon."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestobjects [player, ["Satelit"], 5] > 0 && (player getVariable "spawnBeacon") < 1 and isNil {(nearestobjects [player, ["Satelit"], 5] select 0) getVariable "ownerName"}'];

player addAction["Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", 'count nearestobjects [player, ["EvMoney"],  5] > 0'];

player addAction[("<t color=""#E01B1B"">Destroy Spawn Beacon</t>"), "client\actions\pickupBeacon.sqf", 1, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"], 5]) select 0; (_currBeacon getVariable "owner") == (getPlayerUID player) || str(playerSide) == "GUER" || str(playerSide) != (_currBeacon getVariable "faction") || (_currBeacon getVariable "faction") == "WORLD"'];

player addAction[("<t color=""#21DE31"">Repack Spawn Beacon</t>"), "client\actions\pickupBeacon.sqf", 0, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"], 5]) select 0; (_currBeacon getVariable "owner") == (getPlayerUID player) || str(playerSide) == "GUER" || str(playerSide) != (_currBeacon getVariable "faction") || (_currBeacon getVariable "faction") == "WORLD"'];

player addAction["Pickup Camo Net", "client\actions\pickupcamonet.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_CamoNet_NATO"],  5] select 0) < 5 and (player getVariable "camonet")<1 '];

player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 7, false, false, "", 'mutexScriptInProgress'];

_player groupChat format["Player Initialization Complete"];

playerSetupComplete = true;
