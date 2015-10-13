//	@file Version: 1.0
//	@file Name: respawnVehicles.sqf
//	@file Author: nitro glycerine
//	@file Created: 29/08/2015 5:50 PM
//	@file Args: [] spawn respawnVehicles;

if(!isServer) exitWith { };

private["_townPosition", "_townRadius", "_townName"];

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

	sleep 60.0 - ((count townList) * 0.1);
};
