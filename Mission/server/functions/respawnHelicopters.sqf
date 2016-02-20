//	@file Version: 1.0
//	@file Name: respawnHelicopters.sqf
//	@file Author: nitro glycerine
//	@file Created: 30/08/2015 1:43 AM
//	@file Args: [] spawn respawnHelicopters;

if(!isServer) exitWith { };

private["_helicopterIndex", "_helicopterPosition", "_helicopterData", "_helicopter", "_helicopterTime"];

while { true } do {

	_helicopterIndex = 0;

	while { _helicopterIndex < numberOfHelicopterSpawns } do {
		_helicopterPosition = getMarkerPos format["heliSpawn_%1", _helicopterIndex + 1];

		_helicopterData = helicopters select _helicopterIndex;
		_helicopter = _helicopterData select 0;
		_helicopterTime = _helicopterData select 1;

		if(isNull _helicopter || !alive _helicopter) then {
			if(_helicopterTime == 0) then {
				_helicopterData set[1, time];
			}
			else {
				if(time - _helicopterTime > 600) then {
					deleteVehicle _helicopter;

					helicopters set[_helicopterIndex, [[_helicopterPosition, random 360.0, helicopterCategories] call spawnVehicle, 0]];
				};
			};
		};

		_helicopterIndex = _helicopterIndex + 1;

		sleep 0.1;
	};

	sleep 60.0 - (numberOfHelicopterSpawns * 0.1);
};
