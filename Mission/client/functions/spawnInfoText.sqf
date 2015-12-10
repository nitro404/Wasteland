//	@file Version: 1.0
//	@file Name: spawnInfoText.sqf
//	@file Author: nitro glycerine
//	@file Created: 22/08/2015 2:44 PM
//      @file Usage: [delay, townName] execVM "client\functions\spawnInfoText.sqf";
//                   [delay] execVM "client\functions\spawnInfoText.sqf";
//                   [townName] execVM "client\functions\spawnInfoText.sqf";

private["_delay", "_townName", "_townNameLength", "_closestTown", "_directionFromTownAzimuth", "_directionFromTownBearing", "_leadingZero"];

_delay = 0;
_townName = "";
_closestTown = "";
_directionFromTownAzimuth = 0;
_directionFromTownBearing = "";
_leadingZero = "";

if(count _this > 0) then {
	if(typeName (_this select 0) == "SCALAR") then {
		_delay = _this select 0;
	};

	if(typeName (_this select 0) == "STRING") then {
		_townName = _this select 0;
	};
};

if(count _this > 1) then {
	if(typeName (_this select 1) == "STRING") then {
		_townName = _this select 1;
	};
};

if(_delay > 0) then {
	sleep _delay;
};

_townNameLength = count (toArray _townName);
if(_townNameLength <= 0) then {
	_closestTown = (getPos player) call closestTown;
	_directionFromTownAzimuth = [getMarkerPos(_closestTown select 0), getPos player] call BIS_fnc_dirTo;
	_directionFromTownBearing = [_directionFromTownAzimuth, true] call azimuthToBearing;
};

_mins = floor(60 * (daytime - floor(daytime)));
if(_mins < 10) then {
	_leadingZero = "0";
};

[
	"Rolling Thunder Wasteland",
	if(_townNameLength > 0) then { _townName } else { format["%1 of %2", _directionFromTownBearing, _closestTown select 2] },
	format["%1:%2%3", floor(daytime), _leadingZero, _mins]
] spawn BIS_fnc_infoText;
