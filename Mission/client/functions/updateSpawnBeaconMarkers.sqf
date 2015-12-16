private["_spawnBeacons", "_friendlyBeacons", "_squadIds", "_ownerSide", "_marker", "_markerName"];

{
	deleteMarkerLocal _x;
} forEach currentSpawnBeaconMarkers;
currentSpawnBeaconMarkers = [];

_spawnBeacons = nil;

if(side group player == resistance) then {
	_spawnBeacons = spawnBeaconsIndependent;
};

if(side group player == west) then {
	_spawnBeacons = spawnBeaconsBluFor;
};

if(side group player == east) then {
	_spawnBeacons = spawnBeaconsOpFor;
};

if(isNil "_spawnBeacons") exitWith { };

_friendlyBeacons = [];

{
	_ownerId = _x select 3;
	_squadIds = [];

	if(side group player == resistance) then {
		{
			[_squadIds, getPlayerUID _x] call BIS_fnc_arrayPush;
		} forEach (units group player);
	};

	_ownerSide = "";
	{
		if(getPlayerUID _x == _ownerId) exitWith {
			_ownerSide = str side group _x;
		};
	} forEach playableUnits;

	if(str side group player == _x select 6 && _ownerSide == _x select 6 && (side group player != resistance || (_ownerId in _squadIds || getPlayerUID player == _ownerId))) then {
		[_friendlyBeacons, _x] call BIS_fnc_arrayPush;
	};
} forEach _spawnBeacons;

{
	_markerName = format["Beacon_%1", _x select 3];

	_marker = createMarkerLocal [_markerName, _x select 1];
	_marker setMarkerTypeLocal "mil_destroy";
	_marker setMarkerSizeLocal [1.25, 1.25];
	_marker setMarkerTextLocal (format["%1 Spawn Beacon", _x select 0]);

	if(side group player == resistance) then {
		_marker setMarkerColorLocal "ColorGreen";
	};

	if(side group player == west) then {
		_marker setMarkerColorLocal "ColorBlue";
	};

	if(side group player == east) then {
		_marker setMarkerColorLocal "ColorRed";
	};

	[currentSpawnBeaconMarkers, _markerName] call BIS_fnc_arrayPush;
} forEach _friendlyBeacons;
