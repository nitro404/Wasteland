//	@file Version: 1.0
//	@file Name: makeBuildingsIndestructible.sqf
//	@file Author: nitro glycerine
//	@file Created: 13/10/2015 9:23 PM

diag_log "Making Buildings Indestructible...";

_totalBuildingsModified = 0;

{
	_x allowDamage false;

	_totalBuildingsModified = _totalBuildingsModified + 1;
} forEach nearestObjects [[(worldDimensions select 0) / 2, (worldDimensions select 1) / 2, 0], indestructibleBuildings, 65535];

diag_log format["Made %1 Buildings Indestructible!", _totalBuildingsModified];
