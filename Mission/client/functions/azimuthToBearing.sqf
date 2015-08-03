// [direction player, false] call compile preprocessFile "client\functions\azimuthToBearing.sqf";

_short = [
	'N',
	'NE',
	'E',
	'SE',
	'S',
	'SW',
	'W',
	'NW',
	'N'
];

_long = [
	'North',
	'Northeast',
	'East',
	'Southeast',
	'South',
	'Southwest',
	'West',
	'Northwest',
	'North'
];

_dir      = _this select 0;
_use_long = _this select 1;

if(_dir < 0) then {
	_dir = _dir + 360;
};

_index = round(_dir / 45);

_strings = if(_use_long) then {
	_long
}
else {
	_short
};

_strings select _index
