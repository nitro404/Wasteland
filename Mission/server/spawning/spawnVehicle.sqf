//	@file Version: 1.0
//	@file Name: spawnVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 23/08/2015 11:13 PM
//	@file Args: [position, direction, category, respawn, delay] call spawnVehicle;
//              ie. [[136, 289, 0], 125, helicopterCategories, false, -1] call spawnVehicle;
//              [position, direction, type, missionVehicle, respawn, delay] call spawnVehicle;
//              ie. [[260, 140, 0], 278, "AH6D", true, false, -1] call spawnVehicle;

if(!isServer) exitWith { };

private["_vehiclePosition", "_vehicleCategory", "_vehicleClassName", "_missionVehicle", "_respawnVehicle", "_vehicle", "_vehicleInit", "_magazineIndex", "_invalidArgument"];

if(count _this < 3) exitWith {
    diag_log format["spawnVehicle Error: Requires minimum of 3 arguments, received %1.", count _this];
};

_vehiclePosition = _this select 0;
_vehicleDirection = _this select 1;
_vehicleCategory = nil;
_vehicleClassName = nil;
_missionVehicle = false;
_respawnVehicle = false;
_respawnDelay = 0;
_vehicleInit = nil;
_invalidArgument = false;

if(typeName _vehiclePosition != "ARRAY") exitWith {
    diag_log format["spawnVehicle Arg0 Error: Invalid position argument - expected array, received %1.", typeName _vehiclePosition];
};

if(typeName _vehicleDirection != "SCALAR") exitWith {
    diag_log format["spawnVehicle Arg1 Error: Invalid direction argument - expected scalar, received %1.", typeName _vehicleDirection];
};

if(typeName (_this select 2) == "ARRAY") then {
    _vehicleCategory = _this select 2;

    if(count _this > 3) then {
        if(typeName (_this select 3) == "BOOL") then {
            _respawnVehicle = _this select 3;

            if(count _this > 4) then {
                if(typeName (_this select 4) == "SCALAR") then {
                    _respawnDelay = _this select 4;
                }
                else {
                    diag_log format["spawnVehicle Arg4 Error: Invalid respawn delay argument - expected scalar, received %1.", typeName (_this select 4)];

                    _invalidArgument = true;
                };
            };
        }
        else {
            diag_log format["spawnVehicle Arg3 Error: Invalid respawn argument - expected bool, received %1.", typeName (_this select 3)];

            _invalidArgument = true;
        };
    };
}
else {
    if(typeName (_this select 2) == "STRING") then {
        _vehicleClassName = _this select 2;

        if(count _this > 3) then {
            if(typeName (_this select 3) == "BOOL") then {
                _missionVehicle = _this select 3;

                if(count _this > 4) then {
                    if(typeName (_this select 4) == "BOOL") then {
                        _respawnVehicle = _this select 4;

                        if(count _this > 5) then {
                            if(typeName (_this select 5) == "SCALAR") then {
                                _respawnDelay = _this select 5;
                            }
                            else {
                                diag_log format["spawnVehicle Arg5 Error: Invalid respawn delay argument - expected scalar, received %1.", typeName (_this select 4)];

                                _invalidArgument = true;
                            };
                        };
                    }
                    else {
                        diag_log format["spawnVehicle Arg4 Error: Invalid respawn argument - expected bool, received %1.", typeName (_this select 4)];

                        _invalidArgument = true;
                    };
                };
            }
            else {
                diag_log format["spawnVehicle Arg3 Error: Invalid mission vehicle argument - expected bool, received %1.", typeName (_this select 3)];

                _invalidArgument = true;
            };
        };
    }
    else {
        diag_log format["spawnVehicle Arg2 Error: Invalid category / type argument - expected array or string, received %1.", typeName (_this select 2)];

        _invalidArgument = true;
    };
};

if(_invalidArgument) exitWith { };

if(isNil { _vehicleClassName }) then {
    _vehicleClassName = _vehicleCategory call randomObject;
};

_vehicle = createVehicle [_vehicleClassName, _vehiclePosition, [], 0, "NONE"];
if(_vehicle isKindOf "Ship") then {
    _vehicle setPosASL[_vehiclePosition select 0, _vehiclePosition select 1, 0];
}
else {
    _vehicle setPos[getPos _vehicle select 0, getPos _vehicle select 1, 0];
};
_vehicle addEventHandler["GetIn", { _this call enteredVehicle; } ];
_vehicle addEventHandler["GetOut", { _this call exitedVehicle; } ];

if(_missionVehicle) then {
    _vehicle setVariable["missionVehicle", true, true];
};

if(_vehicle isKindOf "Tank") then {
    if(_vehicle isKindOf "M2A3_EP1") then {
        _vehicleInit = "this setObjectTexture[0, ""textures\M2\base_co.paa""]; this setObjectTexture[1, ""textures\M2\a3_co.paa""]; this setObjectTexture[2, ""textures\M2\ultralp_co.paa""];";
    };

    if(_vehicle isKindOf "M6_EP1") then {
        _vehicleInit = "this setObjectTexture[0, ""textures\M2\base_co.paa""]; this setObjectTexture[1, ""textures\M2\a3_co.paa""]; this setObjectTexture[2, ""textures\M2\ultralp_co.paa""]; this setObjectTexture[3, ""textures\M2\base_co.paa""];";
    };
};

if(_vehicle isKindOf "Helicopter") then {
    if(_vehicle isKindOf "Ka60_PMC") then {
        _vehicle addMagazine "120Rnd_CMFlareMagazine";
        _vehicle addWeapon "CMFlareLauncher";
    };

    if(_vehicle isKindOf "AH64D" || _vehicle isKindOf "AH64D_EP1") then {
        _vehicle removeMagazineTurret["60Rnd_CMFlareMagazine", [-1]];
        _vehicle addMagazineTurret["120Rnd_CMFlareMagazine", [-1]];
    };
};

if(_vehicle isKindOf "Plane") then {
    if(_vehicle isKindOf "C130J") then {
        for "_magazineIndex" from 0 to 1 do {
            _vehicle addMagazine "6Rnd_GBU12_AV8B";
        };
        _vehicle addWeapon "BombLauncher";
    };

    if(_vehicle isKindOf "An2_TK_EP1" || _vehicle isKindOf "An2_1_TK_CIV_EP1") then {
        for "_magazineIndex" from 0 to 1 do {
            _vehicle addMagazine "500Rnd_TwinVickers";
        };
        _vehicle addWeapon "TwinVickers";

        for "_magazineIndex" from 0 to 15 do {
            _vehicle addMagazine "OG9_HE";
        };
        _vehicle addWeapon "SPG9";
    };

    if(_vehicle isKindOf "L39_TK_EP1") then {
        for "_magazineIndex" from 0 to 2 do {
            _vehicle addMagazine "150Rnd_23mm_GSh23L";
        };
    };
};

if(_respawnVehicle && _respawnDelay >= 0) then {
    _vehicleInit = format["%1 veh = [this, %2] execVM ""server\functions\respawnVehicle.sqf"";", if(isNil { _vehicleInit }) then { "" } else { _vehicleInit }, _respawnDelay]
};

if(!isNil { _vehicleInit }) then {
    _vehicle setVehicleInit _vehicleInit;

    processInitCommands;
};

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;

if(!_missionVehicle && (_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Ship")) then {
    _vehicle setFuel((random 0.75) + 0.25);
    _vehicle setDamage((random 0.50));
};

_vehicle setDir _vehicleDirection;
_vehicle setVelocity[0, 0, 1];

_vehicle call randomVehicleWeapons;

_vehicle
