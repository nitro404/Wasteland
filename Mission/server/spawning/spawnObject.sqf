//	@file Version: 1.0
//	@file Name: spawnObject.sqf
//	@file Author: nitro glycerine
//	@file Created: 26/08/2015 8:21 PM
//	@file Args: [position, direction, category] call spawnObject;
//              ie. [[210, 186, 0], 087, buildingCategories] call spawnObject;
//              [position, direction, type] call spawnObject;
//              ie. [[317, 255, 0], 167, "KORD"] call spawnObject;

if(!isServer) exitWith { };

private["_objectPosition", "_objectCategory", "_objectClassName", "_object"];

if(count _this < 3) exitWith {
    diag_log format["spawnObject Error: Requires minimum of 3 arguments, received %1.", count _this]
};

_objectPosition = _this select 0;
_objectDirection = _this select 1;
_objectCategory = nil;
_objectClassName = nil;

if(typeName _objectPosition != "ARRAY") exitWith {
    diag_log format["spawnObject Arg0 Error: Invalid position argument - expected array, received %1.", typeName _objectPosition]
};

if(typeName _objectDirection != "SCALAR") exitWith {
    diag_log format["spawnObject Arg1 Error: Invalid direction argument - expected scalar, received %1.", typeName _objectDirection]
};

if(typeName (_this select 2) == "ARRAY") then {
    _objectCategory = _this select 2;
}
else {
    if(typeName (_this select 2) == "STRING") then {
        _objectClassName = _this select 2;
    }
    else {
        if(true) exitWith {
            diag_log format["spawnObject Arg2 Error: Invalid category / type argument - expected array or string, received %1.", typeName (_this select 2)]
        };
    };
};

if(isNil { _objectClassName }) then {
    _objectClassName = _objectCategory call randomObject;
};

_object = createVehicle [_objectClassName, _objectPosition, [], 0, "NONE"];
_object setPosATL[getPosATL _object select 0, getPosATL _object select 1, 0];
_object setDir _objectDirection;
_object setVelocity[0, 0, 1];

_object
