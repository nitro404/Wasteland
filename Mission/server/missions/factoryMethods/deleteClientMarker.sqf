//	@file Version: 1.0
//	@file Name: deleteClientMarker.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19
//	@file Args: missionMarkerName call deleteClientMarker;

if(!isServer) exitWith { };

{
	if(_x select 0 == _this) then {
		clientMissionMarkers = [clientMissionMarkers, _forEachIndex] call BIS_fnc_removeIndex;
		publicVariable "clientMissionMarkers";
	};
} forEach clientMissionMarkers;
