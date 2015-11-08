//	@file Version: 1.1
//	@file Name: pickupcamonet.sqf
//	@file Author: Sixty8 Pulse
//	@file Date modified: 17/12/2012 20:19

if(mutexScriptInProgress) exitWith { };

mutexScriptInProgress = true;

_camonet = nearestobjects [getpos player, ["Land_CamoNet_NATO"],  5] select 0;

if(isNil { _camonet }) exitWith { };

deleteVehicle _camonet;

player setVariable ["camonet", 1, true];

player playmove "AinvPknlMstpSlayWrflDnon";

sleep 2.9;

player globalChat format["You have picked up a camo net."];

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";

sleep 1;

mutexScriptInProgress = false;
