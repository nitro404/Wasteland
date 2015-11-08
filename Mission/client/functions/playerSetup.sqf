
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_player", "_startingMoney", "_money"];

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

_money = _player getVariable "money";

if(isNil { _money }) then {
	_player setVariable["money", _startingMoney, true];
}
else {
	if(typeName _money != "SCALAR") then {
		_player setVariable["money", _startingMoney, true];
	}
	else {
		if(_player getVariable "money" < _startingMoney) then {
			_player setVariable["money", _startingMoney, true];
		};
	};
};

_bounty = _player getVariable "bounty";

if(isNil { _bounty }) then {
	_player setVariable["bounty", 0, true];
}
else {
	if(typeName _bounty != "SCALAR") then {
		_player setVariable["bounty", 0, true];
	}
	else {
		if(_player getVariable "bounty" < 0) then {
			_player setVariable["bounty", 0, true];
		};
	};
};

_player setVariable["medkits", 0, true];
_player setVariable["repairkits", 0, true];
_player setVariable["fuelFull", 1, true];
_player setVariable["fuelEmpty", 0, true];
_player setVariable["spawnBeacon", 0, true];
_player setVariable["ShowNameAllies", false, true];
_player setVariable["camonet", 0, true];

if(isNil { _player getVariable "earplugs" }) then {
	_player setVariable["earplugs", false, true];
};

player addAction["Take Jerry Can", "noscript.sqf", 'deleteVehicle (nearestObjects [player, ["Fuel_can"], 5] select 0); player setVariable["fuelFull", 1, true]; hint "You have taken a fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestObjects [player, ["Fuel_can"],  5] > 0 && ((player getVariable "fuelFull") == 0) && ((player getVariable "fuelEmpty") == 0) && ((nearestObjects [player, ["Fuel_can"], 5] select 0) getVariable "fuel")'];

player addAction["Take Empty Jerry Can", "noscript.sqf", 'deleteVehicle (nearestObjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelEmpty", 1, true]; hint "You have taken a empty fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestObjects [player, ["Fuel_can"],  5] > 0 && ((player getVariable "fuelFull") == 0) && ((player getVariable "fuelEmpty") == 0) && !((nearestObjects [player, ["Fuel_can"], 5] select 0) getVariable ["fuel", false])'];

player addAction["Refuel Jerry Can", "client\actions\refuelJerryCan.sqf", [], 1, false, false, "", 'if(player distance cursorTarget > 8) exitWith { false }; if(player getVariable "fuelEmpty" == 0) exitWith { false }; _isFuelSource = false; { if(cursorTarget isKindOf _x) exitWith { _isFuelSource = true; }; } forEach ["Land_Fuel_tank_big", "Land_fuel_tank_small", "Land_A_FuelStation_Feed", "Land_Ind_TankSmall", "Land_Ind_TankSmall2", "Land_Ind_TankSmall2_EP1", "Land_Ind_FuelStation_Feed_Ep1", "Land_Fuel_tank_stairs", "MtvrRefuel", "MtvrRefuel_DES_EP1", "UralRefuel_INS", "UralRefuel_TK_EP1", "UralRefuel_CDF", "KamazRefuel", "V3S_Refuel_TK_GUE_EP1"]; _isFuelSource'];

player addAction["Take Repair kit", "noscript.sqf", 'deleteVehicle (nearestObjects [player, ["Suitcase"], 5] select 0); player setVariable["repairkits", (player getVariable "repairkits") + 1, true]; hint "You have taken a repair kit."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestObjects [player, ["Suitcase"], 5] > 0 && (player getVariable "repairkits") < 2'];

player addAction["Take Medkit", "noscript.sqf", 'deleteVehicle (nearestObjects [player, ["CZ_VestPouch_EP1"], 5] select 0); player setVariable["medkits", (player getVariable "medkits") + 1, true]; hint "You have taken a medkit."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestObjects [player, ["CZ_VestPouch_EP1"], 5] > 0 && (player getVariable "medkits") < 2'];

player addAction["Take Camo Net", "noscript.sqf", 'deleteVehicle (nearestObjects [player, ["CZ_Backpack_EP1"], 5] select 0); player setVariable["camonet", (player getVariable "camonet") + 1, true]; hint "You have taken a camo net."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestObjects [player, ["CZ_Backpack_EP1"], 5] > 0 && (player getVariable "camonet") < 2'];

player addAction["Take Spawn Beacon", "noscript.sqf", 'deleteVehicle (nearestObjects [player, ["Satelit"], 5] select 0); player setVariable["spawnBeacon", (player getVariable "spawnBeacon") + 1, true]; hint "You have taken a spawn beacon."; player playmove "AinvPknlMstpSlayWrflDnon"', 0, false, false, "", 'count nearestObjects [player, ["Satelit"], 5] > 0 && (player getVariable "spawnBeacon") < 1 && isNil {(nearestObjects [player, ["Satelit"], 5] select 0) getVariable "ownerName"}'];

player addAction["Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", 'count nearestObjects [player, ["EvMoney"],  5] > 0'];

player addAction[("<t color=""#E01B1B"">Destroy Spawn Beacon</t>"), "client\actions\pickupBeacon.sqf", 1, 1, false, false, "", 'cursorTarget isKindOf "Satelit" && player distance cursorTarget <= 5 && (cursorTarget getVariable "owner" == getPlayerUID player || str(playerSide) == "GUER" || str(playerSide) != cursorTarget getVariable "faction") && cursorTarget getVariable "faction" != "WORLD"'];

player addAction[("<t color=""#21DE31"">Repack Spawn Beacon</t>"), "client\actions\pickupBeacon.sqf", 0, 1, false, false, "", 'cursorTarget isKindOf "Satelit" && player distance cursorTarget <= 5 && (cursorTarget getVariable "owner" == getPlayerUID player || str(playerSide) == "GUER" || str(playerSide) != cursorTarget getVariable "faction") && cursorTarget getVariable "faction" != "WORLD"'];

player addAction["Pickup Camo Net", "client\actions\pickupcamonet.sqf", [], 1, false, false, "", 'if(player getVariable "camonet" > 0) exitWith { false }; count nearestObjects [player, ["Land_CamoNet_NATO"], 5] > 0'];

player addAction["Unlock Vehicle", "client\actions\unlockVehicle.sqf", [], 0, false, false, "", 'alive cursorTarget && count crew cursorTarget == 0 && locked cursorTarget'];

player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 7, false, false, "", 'mutexScriptInProgress'];

_player groupChat format["Player Initialization Complete"];

playerSetupComplete = true;
