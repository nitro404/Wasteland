_closest = '';
_closestDistance = 10000000;

{
	_townPosition = getMarkerPos (_x select 0);
	_distance = _this distance _townPosition;

	if(_distance < _closestDistance) then {
		_closestDistance = _distance;
		_closest = _x;
	};
} forEach townList;

_closest
