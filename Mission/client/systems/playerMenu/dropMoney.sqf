//	@file Version: 1.0
//	@file Name: dropMoney.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

#include "dialog\player_sys.sqf";

#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0; _selection = (lbSelection GET_CTRL(_idc) select 0); if(isNil {_selection}) then { _selection = 0 }; (GET_CTRL(_idc) lbData _selection)})

private["_playerMenuDialog", "_playerMenuDialogMoneyText"];

if(isNil {dropActive}) then { dropActive = false };
if(isNil {MoneyInUse}) then { MoneyInUse = false };
if(isNil {player getVariable "cmoney"}) then {player setVariable["cmoney", 0, true];};

disableSerialization;

_moneyAmount = parseNumber(GET_SELECTED_DATA(money_value));

if((player getVariable "cmoney" < _moneyAmount) OR (player getVariable "cmoney" < 0)) exitwith {
	hint format["You don't have $%1 to drop!", _moneyAmount];
};

if(_moneyAmount < 1) exitWith { };

if((vehicle player) != player) exitWith {
	player globalChat "You can't drop money while in a vehicle.";
};

_currPosition = getPosATL player;
_droppedCash = "Evmoney" createVehicle (position player);
_droppedCash setPos _currPosition;
_droppedCash setVariable["money", _moneyAmount, true];
_droppedCash setVariable["owner", "world", true];

player setVariable["cmoney", (player getVariable "cmoney") - _moneyAmount, true];

_playerMenuDialog = findDisplay playersys_DIALOG;

if(!isNil {_playerMenuDialog}) then {
	_playerMenuDialogMoneyText = _playerMenuDialog displayCtrl money_text;

	if(!isNil {_playerMenuDialogMoneyText}) then {
		if(isNil {player getVariable "cmoney"}) then {
			_playerMenuDialogMoneyText ctrlSetText "0";
		}
		else {
			_playerMenuDialogMoneyText ctrlSetText format["%1", player getVariable "cmoney"];
		};
	};
};
