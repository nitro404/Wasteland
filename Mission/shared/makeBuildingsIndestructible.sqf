//	@file Version: 1.0
//	@file Name: makeBuildingsIndestructible.sqf
//	@file Author: nitro glycerine
//	@file Created: 13/10/2015 9:23 PM

_totalBuildingsModified = 0;
_indestructibleBuildings = nearestObjects [[(worldDimensions select 0) / 2, (worldDimensions select 1) / 2, 0], indestructibleBuildings, 65535];

{
	_x allowDamage false;
	_totalBuildingsModified = _totalBuildingsModified + 1;
} forEach _indestructibleBuildings;

diag_log format["Made %1 Buildings Indestructible", _totalBuildingsModified];
