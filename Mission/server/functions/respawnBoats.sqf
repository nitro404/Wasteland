//	@file Version: 1.0
//	@file Name: respawnBoats.sqf
//	@file Author: nitro glycerine
//	@file Created: 22/10/2015 6:28 PM
//	@file Args: [] spawn respawnBoats;

if(!isServer) exitWith { };

private["_boatIndex", "_boatPosition", "_boatData", "_boat", "_boatTime"];

while { true } do {

	_boatIndex = 0;

	while { _boatIndex < numberOfBoatSpawns } do {
		_boatPosition = getMarkerPos format["boatSpawn_%1", _boatIndex + 1];

		_boatData = boats select _boatIndex;
		_boat = _boatData select 0;
		_boatTime = _boatData select 1;

		if(isNull _boat || !alive _boat) then {
			if(_boatTime == 0) then {
				_boatData set[1, time];
			}
			else {
				if(time - _boatTime > 600) then {
					deleteVehicle _boat;

					boats set[_boatIndex, [[_boatPosition, random 360.0, boatCategories] call spawnVehicle, 0]];
				};
			};
		};

		_boatIndex = _boatIndex + 1;

		sleep 0.1;
	};

	sleep 60.0 - (numberOfBoatSpawns * 0.1);
};
