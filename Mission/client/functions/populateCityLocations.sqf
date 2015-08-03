{
	_pos = getMarkerPos (_x select 0);
	_name = _x select 2;

	cityLocations = cityLocations + [[_pos, _name, _x select 0]];
} forEach cityList;
