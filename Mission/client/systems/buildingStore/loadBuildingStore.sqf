#include "dialog\buildingStoreDefines.sqf";

disableSerialization;

_buildingStoreDialog = createDialog "buildingStoreDialog";

_dialog = findDisplay buildingStore_DIALOG;

_buildingPriceText = _dialog displayCtrl buildingStore_price;

_buildingPriceText CtrlsetText "";

selectedBuildingStore = str(_this select 0);

if(selectedBuildingStore == "buildingStore1") then { buildingStoreSpawn = buildingStoreSpawn1; };
if(selectedBuildingStore == "buildingStore2") then { buildingStoreSpawn = buildingStoreSpawn2; };
if(selectedBuildingStore == "buildingStore3") then { buildingStoreSpawn = buildingStoreSpawn3; };
if(selectedBuildingStore == "buildingStore4") then { buildingStoreSpawn = buildingStoreSpawn4; };
if(selectedBuildingStore == "buildingStore5") then { buildingStoreSpawn = buildingStoreSpawn5; };
if(selectedBuildingStore == "buildingStore6") then { buildingStoreSpawn = buildingStoreSpawn5; };
