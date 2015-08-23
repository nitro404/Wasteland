#include "dialog\buildingStoreDefines.sqf";

disableSerialization;

_buildingStoreDialog = createDialog "buildingStoreDialog";

_dialog = findDisplay buildingStore_DIALOG;

_buildingPriceText = _dialog displayCtrl buildingStore_price;

_buildingPriceText CtrlsetText "";

selectedBuildingStore = str(_this select 0);

if(selectedBuildingStore == "buildingStore1") then { buildingStoreSpawn = buildingStoreSpawn1; };
//if(selectedBuildingStore == "buildingStore2") then { buildingStoreSpawn = buildingSpawn2; };
//if(selectedBuildingStore == "buildingStore3") then { buildingStoreSpawn = buildingSpawn3; };
