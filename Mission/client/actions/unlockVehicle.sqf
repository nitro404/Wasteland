//	@file Version: 1.0
//	@file Name: unlockVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 05/11/2015 6:09 PM

if(isDedicated) exitWith { };

if(!alive cursorTarget) exitWith { };

if(!(cursorTarget isKindOf "LandVehicle" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship")) exitWith { };

if(count crew cursorTarget > 0) exitWith { };

if(!locked cursorTarget) exitWith { };

cursorTarget setVehicleLock "UNLOCKED";

player globalChat format["%1 is now unlocked.", typeOf cursorTarget];
