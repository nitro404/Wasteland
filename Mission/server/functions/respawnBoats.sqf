//	@file Version: 1.0
//	@file Name: respawnBoats.sqf
//	@file Author: nitro glycerine
//	@file Created: 22/10/2015 6:28 PM
//	@file Args: [] spawn respawnBoats;

if(!isServer) exitWith { };

private["_boatIndex", "_boatPosition"];

while { true } do {

	_boatIndex = 0;

	while { _boatIndex < numberOfBoatSpawns } do {
		_boatPosition = getMarkerPos format["boatSpawn_%1", _boatIndex + 1];

		if(count (_boatPosition nearEntities ["Ship", 50]) == 0) then {
			_boat = [_boatPosition, random 360.0, boatCategories] call spawnVehicle;
		};

		_boatIndex = _boatIndex + 1;

		sleep 0.1;
	};

	sleep 600.0 - (numberOfBoatSpawns * 0.1);
};
