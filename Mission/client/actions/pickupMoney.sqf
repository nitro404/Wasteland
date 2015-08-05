//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

_maxMoneyDistance = 5;
_moneyObject = (nearestObjects [getpos player, ["EvMoney"],  _maxMoneyDistance] select 0);

if((_moneyObject getVariable "owner") == "world") then {
   	_moneyObject setVariable ["owner", getPlayerUID player, true];
};

if((_moneyObject getVariable "owner") != getPlayerUID player) exitWith {
	player globalChat "This money is already being picked up.";
};

if(vehicle player != player) exitWith {
	player globalChat "You can't pick up money while in a vehicle.";
	_moneyObject setVariable ["owner", "world", true];
};

_moneyValue = ((nearestobjects [getpos player, ["EvMoney"], _maxMoneyDistance] select 0) getVariable "money");
deleteVehicle (nearestobjects [getpos player, ["EvMoney"], _maxMoneyDistance] select 0);

if(typeName _moneyValue == "SCALAR" && _moneyValue > 0 && _moneyValue < 1e39) then {
	player setVariable["cmoney", (player getVariable "cmoney") + _moneyValue, true];
	player globalChat format["You have picked up $%1", _moneyValue];
};
