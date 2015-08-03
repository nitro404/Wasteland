// [position player] call compile preprocessFile "client\functions\nearestCity.sqf";

_pos = _this select 0;
_closest = '';
_closest_distance = 10000000;

{
	_distance = _pos distance (_x select 0);

	if(_closest_distance > _distance) then {
		_closest_distance = _distance;
		_closest = _x;
	};
} forEach cityLocations;

_closest
