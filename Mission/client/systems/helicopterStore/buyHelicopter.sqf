#include "dialog\helicopterStoreDefines.sqf";

disableSerialization;

private["_price", "_dialog", "_itemList", "_selectedItem", "_itemText", "_nearestVehicles", "_helicopter"];

_price = 0;

_dialog = findDisplay helicopterStore_DIALOG;

_itemList = _dialog displayCtrl helicopterStore_item_list;

closeDialog helicopterStore_DIALOG;

_selectedItem = lbCurSel _itemList;
_itemText = _itemList lbText _selectedItem;

_nearestVehicles = getPos helicopterStoreSpawn nearEntities [["LandVehicle", "Air"], 8];

if(count _nearestVehicles > 0) exitWith {
	titleText[format["Helicopter purchase failed, spawn is currently blocked by %1!", typeOf (_nearestVehicles select 0)], "PLAIN"];
	titleFadeOut 5;
};

{
	if(_itemText == _x select 0) then {
			_price = _x select 1;

			if(player getVariable "money" < _price) exitWith {
				hintSilent format["You do not have enough money to purchase a %1.", _x select 0];
			};

			player setVariable["money", (player getVariable "money") - _price, true];

			_helicopter = createVehicle[(_x select 2), getPosATL helicopterStoreSpawn, [], 0, "CAN_COLLIDE"];
			_helicopter setPosATL getPosATL helicopterStoreSpawn;
			_helicopter setDir (getDir helicopterStoreSpawn);
			_helicopter setVariable["R3F_LOG_disabled", false, true];
			_helicopter setVariable["owner", getPlayerUID player, true];
			_helicopter setVariable["creationTime", time, true];
			_helicopter addEventHandler["GetIn", { [_this] call enteredVehicle; } ];
			_helicopter addEventHandler["GetOut", { [_this] call exitedVehicle; } ];

			if(_helicopter isKindOf "Ka60_PMC") then {
				_helicopter addMagazine "120Rnd_CMFlareMagazine";
				_helicopter addWeapon "CMFlareLauncher";
			};

			if(_helicopter isKindOf "AH64D" || _helicopter isKindOf "AH64D_EP1") then {
				_helicopter removeMagazineTurret["60Rnd_CMFlareMagazine", [-1]];
				_helicopter addMagazineTurret["120Rnd_CMFlareMagazine", [-1]];
			};

			clearMagazineCargoGlobal _helicopter;
			clearWeaponCargoGlobal _helicopter;

			titleText[format["%1 Purchased!", _x select 0], "PLAIN"];
			titleFadeOut 3;
	};
} forEach helicopterStore;
