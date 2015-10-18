//	@file Version: 1.0
//	@file Name: dropMoney.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

#include "dialog\player_sys.sqf";

private["_moneyAmount", "_canDropMoney", "_timeRemaining", "_droppedCash", "_playerMenuDialog", "_playerMenuDialogMoneyValue"];

disableSerialization;

if(isNil {player getVariable "cmoney"}) then {
	player setVariable["cmoney", 0, true];
};

_moneyAmount = floor(parseNumber(ctrlText money_value));

if(_moneyAmount < 1) exitWith {
	player globalChat format["You must enter a valid number!"];
};

if((player getVariable "cmoney" < _moneyAmount) OR (player getVariable "cmoney" < 0)) exitwith {
	player globalChat format["You don't have $%1 to drop!", _moneyAmount];
};

if((vehicle player) != player) exitWith {
	player globalChat "You can't drop money while in a vehicle.";
};

_canDropMoney = true;

if(!isNil { lastMoneyDropTime }) then {
	_timeRemaining = 60 - floor(time - lastMoneyDropTime);

	if(_timeRemaining < 0) then {
		_timeRemaining = 0;
	};

	if(_timeRemaining > 0) then {
		player globalChat format["You can only drop money once every minute, %1 seconds remaining.", _timeRemaining];

		_canDropMoney = false;
	};
};

if(!_canDropMoney) exitWith { };

lastMoneyDropTime = time;

_droppedCash = "Evmoney" createVehicle (position player);
_droppedCash setPos (getPosATL player);
_droppedCash setVariable["money", _moneyAmount, true];
_droppedCash setVariable["R3F_LOG_disabled", true];
_droppedCash setVariable["owner", getPlayerUID player, true];
_droppedCash setVariable["creationTime", time, true];

player setVariable["cmoney", (player getVariable "cmoney") - _moneyAmount, true];

player globalChat format["You have dropped $%1.", _moneyAmount];

_playerMenuDialog = findDisplay playersys_DIALOG;

if(!isNil {_playerMenuDialog}) then {
	_playerMenuDialogMoneyValue = _playerMenuDialog displayCtrl money_value;

	if(!isNil {_playerMenuDialogMoneyValue}) then {
		if(isNil {player getVariable "cmoney"}) then {
			_playerMenuDialogMoneyValue ctrlSetText "0";
		}
		else {
			_playerMenuDialogMoneyValue ctrlSetText format["%1", player getVariable "cmoney"];
		};
	};
};
