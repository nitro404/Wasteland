//	@file Version: 1.0
//	@file Name: respawnVehicles.sqf
//	@file Author: nitro glycerine
//	@file Created: 29/08/2015 5:50 PM
//	@file Args: [] spawn respawnVehicles;

if(!isServer) exitWith { };

private["_numberOfTownVehicleLists", "_townIndex", "_townInfo", "_townPosition", "_townRadius", "_townVehicleListInfo", "_townVehicleList", "_townVehicleIndex", "_townVehicle"];

_numberOfTownVehicleLists = count townVehicles;

while { true } do {

	_townIndex = 0;

	while { _townIndex < _numberOfTownVehicleLists } do {

		_townPosition = getMarkerPos format["Spawn_%1", _townIndex];
		_townRadius = spawnLocations select _townIndex;

		_townVehicleListInfo = townVehicles select _townIndex;
		_townVehicleList = _townVehicleListInfo select 0;
		_townVehicleIndex = 0;

		while { _townVehicleIndex < count _townVehicleList } do {
			_townVehicle = _townVehicleList select _townVehicleIndex;

			if(isNull _townVehicle || !alive _townVehicle) then {
				_townVehicleList = [_townVehicleList, _townVehicleIndex] call BIS_fnc_removeIndex;
			}
			else {
				if(_townVehicle distance _townPosition > _townRadius) then {
					_townVehicleList = [_townVehicleList, _townVehicleIndex] call BIS_fnc_removeIndex;
				}
				else {
					_townVehicleIndex = _townVehicleIndex + 1;
				};
			};
		};

		_townVehicleListInfo set[0, _townVehicleList];

		if(count _townVehicleList < _townVehicleListInfo select 1) then {
			[_townVehicleList, [[_townPosition, _townRadius, true] call randomPosition, random 360.0, vehicleCategories] call spawnVehicle] call BIS_fnc_arrayPush;
		};

		_townIndex = _townIndex + 1;

		sleep 0.1;
	};

	sleep 60.0 - (_numberOfTownVehicleLists * 0.1);
};
