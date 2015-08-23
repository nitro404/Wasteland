// [position player] call compile preprocessFile "client\functions\closestTown.sqf";

_playerPosition = _this select 0;
_closest = '';
_closestDistance = 10000000;

{
	_townPosition = getMarkerPos (_x select 0);
	_distance = _playerPosition distance (_townPosition);

	if(_distance < _closestDistance) then {
		_closestDistance = _distance;
		_closest = _x;
	};
} forEach townList;

_closest
