private["_canSpawnBicycle", "_timeRemaining", "_bicyclePosition"];

_canSpawnBicycle = true;

if(!isNil { lastBicycleSpawnTime }) then {
	_timeRemaining = 10 - floor(time - lastBicycleSpawnTime);

	if(_timeRemaining < 0) then {
		_timeRemaining = 0;
	};

	if(_timeRemaining > 0) then {
		player globalChat format["You can only deploy bikes once every 10 seconds, %1 seconds remaining.", _timeRemaining];

		_canSpawnBicycle = false;
	};
};

if(!_canSpawnBicycle) exitWith { };

lastBicycleSpawnTime = time;

if(isNil "bicycle") then {
    bicycle = objNull;
};

if(!isNull bicycle) then {
    if(!isNull (driver bicycle)) then {
        (driver bicycle) action ["eject", bicycle];
    };

    deleteVehicle bicycle;
};

_bicyclePosition = player modelToWorld [0, 3, 0];
_bicyclePosition set[2, 0];

bicycle = createVehicle [bicycleList call BIS_fnc_selectRandom, _bicyclePosition, [], 0, "NONE"];
bicycle setDir getDir player;
bicycle setPosATL _bicyclePosition;
bicycle setVariable["owner", getPlayerUID player, true];
bicycle setVariable["creationTime", time, true];
bicycle addEventHandler["GetIn", { _this call enteredVehicle; } ];
bicycle addEventHandler["GetOut", { _this call exitedVehicle; } ];
