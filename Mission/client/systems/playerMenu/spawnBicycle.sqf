if(isNil "bicycle") then {
    bicycle = objNull;
};

if(!isNull bicycle) then {
    if(!isNull (driver bicycle)) then {
        (driver bicycle) action ["eject", bicycle];
    };

    deleteVehicle bicycle;
};

_spawnDir = getDir player;
_spawnPos = player modelToWorld [0, 3, 0];
_spawnPos set [2, 0];

bicycle = createVehicle [bicycleList select floor(random count bicycleList), _spawnPos, [], 0, "NONE"];
bicycle setDir _spawnDir;
bicycle setPosATL _spawnPos;
bicycle setVariable["owner", _playerUID, true];
bicycle setVariable["creationTime", time, true];
