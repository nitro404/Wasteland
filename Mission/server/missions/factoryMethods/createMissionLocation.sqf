//	@file Version: 1.0
//	@file Name: createMissionLocation.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19
//	@file Args: spawnLocations call createMissionLocation;
//      @file Return: [missionPosition, missionSpawnMarkerIndex]

if(!isServer) exitWith { };

private["_validMarker", "_missionSpawnMarkerIndex", "_missionSpawnMarkerInfo", "_selectedMarker", "_missionSpawnData"];

_validMarker = false;

while { !_validMarker } do {
	_missionSpawnMarkerIndex = _this call BIS_fnc_randomIndex;
	_missionSpawnMarkerInfo = _this select _missionSpawnMarkerIndex;

	if(!(_missionSpawnMarkerInfo select 1)) then {
		_selectedMarker = _missionSpawnMarkerInfo select 0;
		_missionSpawnData = [getMarkerPos _selectedMarker, _missionSpawnMarkerIndex];
		_missionSpawnMarkerInfo set[1, true];
		_validMarker = true;
	};
};

_missionSpawnData
