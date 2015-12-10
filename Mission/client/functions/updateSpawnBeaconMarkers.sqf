private["_spawnBeacons", "_friendlyBeacons", "_squadIds", "_ownerSide", "_marker", "_markerName"];

{
	deleteMarkerLocal _x;
} forEach currentSpawnBeaconMarkers;
currentSpawnBeaconMarkers = [];

_spawnBeacons = nil;

switch (str playerSide) do {
	case "WEST": { _spawnBeacons = spawnBeaconsBluFor; };
	case "EAST": { _spawnBeacons = spawnBeaconsOpFor; };
	case "GUER": { _spawnBeacons = spawnBeaconsIndependent; };
};

if(isNil "_spawnBeacons") exitWith { };

_friendlyBeacons = [];

{
	_ownerId = _x select 3;
	_squadIds = [];

	if(str playerSide == "GUER") then {
		{
			[_squadIds, getPlayerUID _x] call BIS_fnc_arrayPush;
		} forEach (units group player);
	};

	_ownerSide = "";
	{
		if(getPlayerUID _x == _ownerId) exitWith {
			_ownerSide = str side _x;
		};
	} forEach playableUnits;

	if(str playerSide == _x select 6 && _ownerSide == _x select 6 && (str playerSide != "GUER" || (_ownerId in _squadIds || getPlayerUID player == _ownerId))) then {
		[_friendlyBeacons, _x] call BIS_fnc_arrayPush;
	};
} forEach _spawnBeacons;

{
	_markerName = format["Beacon_%1", _x select 3];

	_marker = createMarkerLocal [_markerName, _x select 1];
	_marker setMarkerTypeLocal "mil_destroy";
	_marker setMarkerSizeLocal [1.25, 1.25];
	_marker setMarkerTextLocal (format["%1 Spawn Beacon", _x select 0]);

	if(str playerSide == "GUER") then {
		_marker setMarkerColorLocal "ColorGreen";
	};

	if(str playerSide == "WEST") then {
		_marker setMarkerColorLocal "ColorBlue";
	};

	if(str playerSide == "EAST") then {
		_marker setMarkerColorLocal "ColorRed";
	};

	[currentSpawnBeaconMarkers, _markerName] call BIS_fnc_arrayPush;
} forEach _friendlyBeacons;
