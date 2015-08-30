//	@file Version: 1.0
//	@file Name: spawnVehicle.sqf
//	@file Author: nitro glycerine
//	@file Created: 23/08/2015 11:13 PM
//	@file Args: [position, direction, category] call spawnVehicle;
//              ie. [[136, 289, 0], 125, helicopterCategories] call spawnVehicle;
//              [position, direction, type, missionVehicle] call spawnVehicle;
//              ie. [[260, 140, 0], 278, "AH6D", true] call spawnVehicle;

if(!X_Server) exitWith { };

private["_vehiclePosition", "_vehicleCategory", "_vehicleClassName", "_missionVehicle", "_vehicle"];

if(count _this < 3) exitWith {
    diag_log format["spawnVehicle Error: Requires minimum of 3 arguments, received %1.", count _this]
};

_vehiclePosition = _this select 0;
_vehicleDirection = _this select 1;
_vehicleCategory = nil;
_vehicleClassName = nil;
_missionVehicle = false;

if(typeName _vehiclePosition != "ARRAY") exitWith {
    diag_log format["spawnVehicle Arg0 Error: Invalid position argument - expected array, received %1.", typeName _vehiclePosition]
};

if(typeName _vehicleDirection != "SCALAR") exitWith {
    diag_log format["spawnVehicle Arg1 Error: Invalid direction argument - expected scalar, received %1.", typeName _vehicleDirection]
};

if(typeName (_this select 2) == "ARRAY") then {
    _vehicleCategory = _this select 2;
}
else {
    if(typeName (_this select 2) == "STRING") then {
        _vehicleClassName = _this select 2;

        if(count _this > 3) then {
            if(typeName (_this select 3) == "BOOL") then {
                _missionVehicle = _this select 3;
            }
            else {
                if(true) exitWith {
                    diag_log format["spawnVehicle Arg3 Error: Invalid mission vehicle argument - expected bool, received %1.", typeName (_this select 3)]
                };
            };
        };
    }
    else {
        if(true) exitWith {
            diag_log format["spawnVehicle Arg2 Error: Invalid category / type argument - expected array or string, received %1.", typeName (_this select 2)]
        };
    };
};

if(isNil "_vehicleClassName") then {
    _vehicleClassName = [_vehicleCategory] call randomObject;
};

_vehicle = createVehicle [_vehicleClassName, _vehiclePosition, [], 0, "NONE"];
_vehicle setPos[getPos _vehicle select 0, getpos _vehicle select 1, 0];

if(_vehicle isKindOf "Tank") then {

    if(_vehicle isKindOf "M2A3_EP1") then {
        _vehicle setVehicleInit "this setObjectTexture[0, ""textures\M2\base_co.paa""]; this setObjectTexture[1, ""textures\M2\a3_co.paa""]; this setObjectTexture[2, ""textures\M2\ultralp_co.paa""];";
    };

    if(_vehicle isKindOf "M6_EP1") then {
        _vehicle setVehicleInit "this setObjectTexture[0, ""textures\M2\base_co.paa""]; this setObjectTexture[1, ""textures\M2\a3_co.paa""]; this setObjectTexture[2, ""textures\M2\ultralp_co.paa""]; this setObjectTexture[3, ""textures\M2\base_co.paa""];";
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
    if(_vehicle isKindOf "L39_TK_EP1") then {
        _vehicle addMagazine "150Rnd_23mm_GSh23L";
        _vehicle addMagazine "150Rnd_23mm_GSh23L";
        _vehicle addMagazine "150Rnd_23mm_GSh23L";
    };
};

processInitCommands;

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;

if(!_missionVehicle && (_vehicle isKindOf "Car" || _vehicle isKindOf "Tank")) then {
    _vehicle setFuel((random 0.50) + 0.50);
    _vehicle setDamage((random 0.50));
};

_vehicle setDir _vehicleDirection;
_vehicle setVelocity[0, 0, 1];

[_vehicle] call randomWeapons;

_vehicle
