//	@file Version: 1.0
//	@file Name: deleteClientMarker.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19
//	@file Args: [missionMarkerName] call createClientMarker;

if(!isServer) exitWith { };

{
	if(_x select 0 == _this select 0) then {
		clientMissionMarkers set [_forEachIndex, objNull];
		clientMissionMarkers = clientMissionMarkers - [objNull];
		publicVariable "clientMissionMarkers";
	};
} forEach clientMissionMarkers;
