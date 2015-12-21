//	@file Version: 1.0
//	@file Name: vehicleMission.sqf
//	@file Author: nitro glycerine
//	@file Created: 10/10/2015 4:30 PM
//  @file Args: [missionType, vehicleClass, missionDelay, missionTimeout, missionNumber] spawn vehicleMission;

if(!isServer) exitWith { };

private["_missionType", "_missionSpawnLocations", "_vehicleClass", "_missionDelay", "_missionTimeout", "_missionNumber", "_missionResult", "_vehicleName", "_vehiclePicture", "_missionMarkerName", "_missionMarker", "_missionAIMarkerName", "_missionAIMarker", "_startTime", "_currTime", "_missionLocationData", "_missionPosition", "_missionSpawnMarkerIndex", "_missionBase", "_offset", "_basePartPosition", "_basePart", "_baseParts", "_nonBlockingBaseParts", "_missionGroup", "_totalNumberOfAI", "_vehicle", "_unitsAlive"];

_missionType = _this select 0;
_vehicleClass = _this select 1;
_missionSpawnLocations  = _this select 2;
_aiCount = _this select 3;
_missionDelay = _this select 4;
_missionTimeout = _this select 5;
_missionBase = _this select 6;
_missionNumber = _this select 7;
_missionResult = 0;
_vehicleName = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName");
_vehiclePicture = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "picture");
_missionMarkerName = format["ActiveMission_%1", _missionNumber];
_missionMarkerText = format["%1 Mission", _vehicleName];

_missionLocationData = _missionSpawnLocations call createMissionLocation;
_missionPosition = _missionLocationData select 0;
_missionSpawnMarkerIndex = _missionLocationData select 1;

_missionDelay call createWaitCondition;

#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif

diag_log format["%1 Started (%2)", _missionType, _vehicleName];

[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>%1</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> has been immobilized; go get it for your team!</t>", _missionType, _vehiclePicture, _vehicleName, "#52bf90", "#FFFFFF"]] call RE;

_baseParts = [];
{
    _offset = _x select 1;
    _basePartPosition = [(_offset select 0) + (_missionPosition select 0), (_offset select 1) + (_missionPosition select 1), _offset select 2];
    _basePart = [_basePartPosition, _x select 2, _x select 0] call spawnObject;
    _basePart setPos _basePartPosition;
    _basePart setVariable ["R3F_LOG_disabled", true, true];
    _basePart allowDamage false;
    [_baseParts, _basePart] call BIS_fnc_arrayPush;

    if(!isNil { _x select 3 }) then {
        if(_x select 3) then {
            _basePart setVariable ["blocking", true];
        };
    };
} forEach _missionBase;

_missionGroup = [_missionPosition, 25, _aiCount] call createAIGroup;

[_missionGroup, _missionPosition] spawn defendArea;

_totalNumberOfAI = count units _missionGroup;

_missionMarker = createMarker [_missionMarkerName, _missionPosition];
_missionMarker setMarkerType "mil_destroy";
_missionMarker setMarkerSize [1.25, 1.25];
_missionMarker setMarkerColor "ColorRed";
_missionMarker setMarkerText _missionMarkerText;

_missionAIMarkerName = format ["%1_AI", _missionMarkerName];
_missionAIMarker = createMarker [_missionAIMarkerName, [_missionPosition select 0, (_missionPosition select 1) - 100]];
_missionAIMarker setMarkerShape "ICON";
_missionAIMarker setMarkerColor "ColorRed";
_missionAIMarker setMarkerSize [1, 1];
_missionAIMarker setMarkerType "dot";
_missionAIMarker setMarkerText format ["%1 of %1 AI", _totalNumberOfAI];

waitUntil {
    sleep 3;

    #ifdef __A2NET__
    _currTime = floor(netTime);
    #else
    _currTime = floor(time);
    #endif

    if(_currTime - _startTime >= _missionTimeout) then {
        _missionResult = 1;
    };

    _unitsAlive = {alive _x} count units _missionGroup;

    _missionMarker setMarkerColor markerColor _missionMarker;
    _missionAIMarker setMarkerText format ["%1 of %2 AI", _unitsAlive, _totalNumberOfAI];

    _missionResult == 1 || _unitsAlive < 1
};

if(_missionResult == 1) then {
    {
        deleteVehicle _x;
    } forEach units _missionGroup;
    deleteGroup _missionGroup;

    {
        deleteVehicle _x
    } forEach _baseParts;
    _baseParts = [];

	[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _vehiclePicture, _vehicleName, "#FF1717", "#FFFFFF"]] call RE;

    diag_log format["%1 Failed (%2)", _missionType, _vehicleName];
}
else {
    deleteGroup _missionGroup;

    _nonBlockingBaseParts = [];
    {
        if(_x getVariable ["blocking", false]) then {
            deleteVehicle _x;
        }
        else {
            [_nonBlockingBaseParts, _x] call BIS_fnc_arrayPush;
        };
    } forEach _baseParts;
    _baseParts = _nonBlockingBaseParts;

	[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The <t color='%4'>%3</t> has been captured.</t>", _missionType, _vehiclePicture, _vehicleName, "#17FF41", "#FFFFFF"]] call RE;

    diag_log format["%1 Completed (%2)", _missionType, _vehicleName];

    _missionMarker setMarkerColor "ColorGreen";

    sleep 3;

    _vehicle = [_missionPosition, random 360, _vehicleClass, true, false, -1] call spawnVehicle;
};

deleteMarker _missionAIMarker;

sleep 10;

deleteMarker _missionMarker;

_missionSpawnLocations select _missionSpawnMarkerIndex set[1, false];

sleep 120;

{
    deleteVehicle _x
} forEach _baseParts;
