//	@file Version: 1.0
//	@file Name: loadGunStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\gunstoreDefines.sqf";

disableSerialization;

_gunshopDialog = createDialog "gunshopd";
gunStoreCart = 0;

_dialog = findDisplay gunshop_DIALOG;
_playerMoney = _dialog displayCtrl gunshop_money;
_money = player getVariable "money";
_playerMoney CtrlsetText format["Cash: $%1", _money];

gsLocation = str(_this select 0);

if(gsLocation == "gs1") then { gsCrate = g_ammo_1; };
if(gsLocation == "gs2") then { gsCrate = g_ammo_2; };
if(gsLocation == "gs3") then { gsCrate = g_ammo_3; };
if(gsLocation == "gs4") then { gsCrate = g_ammo_4; };
if(gsLocation == "gs5") then { gsCrate = g_ammo_5; };
if(gsLocation == "gs6") then { gsCrate = g_ammo_6; };
if(gsLocation == "gs7") then { gsCrate = g_ammo_7; };
