//	@file Version: 1.0
//	@file Name: respawnVehicles.sqf
//	@file Author: nitro glycerine
//	@file Created: 29/08/2015 5:50 PM
//	@file Args: [] spawn respawnVehicles;

if(!X_Server) exitWith { };

private["_townPosition", "_townRadius", "_townName", "_helicopterIndex", "_helicopterPosition"];

while { true } do {

	{
		_townPosition = getMarkerPos (_x select 0);
		_townRadius = _x select 1;
		_townName = _x select 2;

		if(floor(_townRadius * 0.05) - count nearestObjects[_townPosition, ["Car", "Motorcycle", "Tank"], _townRadius] > 0) then {
			[[_townPosition, _townRadius, true] call randomPosition, random 360.0, vehicleCategories] call spawnVehicle;
		};

		sleep 0.1;
	} forEach townList;

	_helicopterIndex = 0;

	while { _helicopterIndex < numberOfHelicopterSpawns } do {
		_helicopterPosition = getMarkerPos format["heliSpawn_%1", _helicopterIndex + 1;

		if(count nearestObjects[_helicopterPosition, ["Helicopter"], 10] == 0) {
			[_helicopterPosition], random 360.0, helicopterCategories] call spawnVehicle;
		};

		_helicopterIndex = _helicopterIndex + 1;

		sleep 0.1;
	};

	sleep 60.0 - ((count townList) * 0.1) - (numberOfHelicopterSpawns * 0.1);
};
