//	@file Version: 1.1
//	@file Name: pickupcamonet.sqf
//	@file Author: Sixty8 Pulse
//	@file Date modified: 17/12/2012 20:19

private["_camoNet"];

if(mutexScriptInProgress) exitWith { };

mutexScriptInProgress = true;

_camoNet = nil;

{
	if(player distance _x <= 5) exitWith {
		_camoNet = _x;
	};
} forEach allMissionObjects "Land_CamoNet_NATO";

if(isNil { _camoNet }) exitWith { };

deleteVehicle _camoNet;

player setVariable ["camonet", 1, true];

player playmove "AinvPknlMstpSlayWrflDnon";

sleep 2.9;

player globalChat format["You have picked up a camo net."];

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";

sleep 1;

mutexScriptInProgress = false;
