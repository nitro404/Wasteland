#include "dialog\helicopterStoreDefines.sqf";

disableSerialization;

_helicopterStoreDialog = createDialog "helicopterStoreDialog";

_dialog = findDisplay helicopterStore_DIALOG;

_helicopterPrice = _dialog displayCtrl helicopterStore_price;

_helicopterPrice ctrlSetText "";

selectedHelicopterStore = str(_this select 0);

if(selectedHelicopterStore == "helicopterStore1") then {
	helicopterStoreSpawn = helicopterStoreSpawn1;
};

if(selectedHelicopterStore == "helicopterStore2") then {
	helicopterStoreSpawn = helicopterStoreSpawn2;
};

if(selectedHelicopterStore == "helicopterStore3") then {
	helicopterStoreSpawn = helicopterStoreSpawn3;
};
