//	@file Version: 1.0
//	@file Name: respawnHelicopters.sqf
//	@file Author: nitro glycerine
//	@file Created: 30/08/2015 1:43 AM
//	@file Args: [] spawn respawnHelicopters;

if(!X_Server) exitWith { };

private["_helicopterIndex", "_helicopterPosition"];

while { true } do {

	_helicopterIndex = 0;

	while { _helicopterIndex < numberOfHelicopterSpawns } do {
		_helicopterPosition = getMarkerPos format["heliSpawn_%1", _helicopterIndex + 1];

		if(count nearestObjects[_helicopterPosition, ["Helicopter"], 50] == 0) then {
			[_helicopterPosition, random 360.0, helicopterCategories] call spawnVehicle;
		};

		_helicopterIndex = _helicopterIndex + 1;

		sleep 0.1;
	};

	sleep 600.0 - (numberOfHelicopterSpawns * 0.1);
};
