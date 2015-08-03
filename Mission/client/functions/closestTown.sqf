// [position player] call compile preprocessFile "client\functions\closestTown.sqf";

_pos = _this select 0;
_closest = '';
_closestDistance = 10000000;

{
	_distance = _pos distance (_x select 0);

	if(_distance < _closestDistance) then {
		_closestDistance = _distance;
		_closest = _x;
	};
} forEach cityLocations;

_closest
