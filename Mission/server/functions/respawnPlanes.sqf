//	@file Version: 1.0
//	@file Name: respawnPlanes.sqf
//	@file Author: nitro glycerine
//	@file Created: 18/2/2016 6:38 PM
//	@file Args: [] spawn respawnPlanes;

if(!isServer) exitWith { };

private["_numberOfPlaneSpawns", "_planeIndex", "_planeSpawn", "_plane"];

_numberOfPlaneSpawns = count planeSpawns;

while { true } do {

	_planeIndex = 0;

	while { _planeIndex < _numberOfPlaneSpawns } do {
		_planeSpawn = planeSpawns select _planeIndex;

		_planeData = planes select _planeIndex;
		_plane = _planeData select 0;
		_planeTime = _planeData select 1;

		if(isNull _plane || !alive _plane) then {
			if(_planeTime == 0) then {
				_planeData set[1, time];
			}
			else {
				if(time - _planeTime > _planeSpawn select 3) then {
					deleteVehicle _plane;

					_plane = [_planeSpawn select 0, _planeSpawn select 1, (_planeSpawn select 2) call BIS_fnc_selectRandom] call spawnVehicle;
					_plane setPos (_planeSpawn select 0);

					planes set[_planeIndex, [_plane, 0]];
				};
			};
		};

		_planeIndex = _planeIndex + 1;

		sleep 0.1;
	};

	sleep 60.0 - (_numberOfPlaneSpawns * 0.1);
};
