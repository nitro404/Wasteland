//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

private["_moneyObject", "_moneyValue"];

_moneyObject = player nearEntities ["EvMoney",  5] select 0;

if(isNil { _moneyObject }) exitWith { };

if(vehicle player != player) exitWith {
	player globalChat "You can't pick up money while in a vehicle.";
};

_moneyValue = floor (_moneyObject getVariable "money");

deleteVehicle _moneyObject;

if(typeName _moneyValue == "SCALAR" && _moneyValue > 0 && _moneyValue < 1e39) then {
	player setVariable["money", (player getVariable "money") + _moneyValue, true];

	player globalChat format["You have picked up $%1", _moneyValue];
};
