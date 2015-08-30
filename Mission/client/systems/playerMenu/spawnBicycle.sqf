if(isNil "userSpawnedBike") then {
    userSpawnedBike = objNull;
};

if(!isNull userSpawnedBike) then {
    if(!isNull (driver userSpawnedBike)) then {
        (driver userSpawnedBike) action ["eject", userSpawnedBike];
    };

    deleteVehicle userSpawnedBike;
};

_spawnDir = getDir player;
_spawnPos = player modelToWorld [0, 3, 0];
_spawnPos set [2, 0];

userSpawnedBike = createVehicle [bicycleList select floor(random count bicycleList), _spawnPos, [], 0, "NONE"];
userSpawnedBike setDir _spawnDir;
userSpawnedBike setPosATL _spawnPos;

userSpawnedBike spawn {
    _count = 0;
    _maxTime = 60;

    waitUntil {
        sleep 0.5;
        _count = _count + 1;
        _count > (_maxTime * 2) || !isNull (driver _this);
    };

    if(_count > (_maxTime * 2)) then {
        deleteVehicle _this;
    };
};
