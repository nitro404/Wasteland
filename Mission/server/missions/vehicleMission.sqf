//	@file Version: 1.0
//	@file Name: vehicleMission.sqf
//	@file Author: nitro glycerine
//	@file Created: 10/10/2015 4:30 PM
//  @file Args: [missionType, vehicleClass, missionDelay, missionTimeout, missionNumber] spawn vehicleMission;

if(!isServer) exitWith { };

#include "setup.sqf"

private["_missionType", "_vehicleClass", "_missionDelay", "_missionTimeout", "_missionNumber", "_missionResult", "_vehicleName", "_vehiclePicture", "_missionMarkerName", "_startTime", "_currTime", "_missionLocationData", "_missionPosition", "_missionSpawnMarkerIndex", "_missionGroup", "_vehicle", "_unitsAlive"];

_missionType = _this select 0;
_vehicleClass = _this select 1;
_missionDelay = _this select 2;
_missionTimeout = _this select 3;
_missionNumber = _this select 4;
_missionResult = 0;
_vehicleName = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName");
_vehiclePicture = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "picture");
_missionMarkerName = format["ActiveMission_%1", _missionNumber];

diag_log format["WASTELAND SERVER - %1 Started (%2)", _missionType, _vehicleName];

_missionLocationData = call createMissionLocation;
_missionPosition = _missionLocationData select 0;
_missionSpawnMarkerIndex = _missionLocationData select 1;

diag_log format["WASTELAND SERVER - %1 Waiting to Run (%2)", _missionType, _vehicleName];

[_missionDelay] call createWaitCondition;

#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif

diag_log format["WASTELAND SERVER - %1 Resumed (%1)", _missionType, _vehicleName];

[_missionMarkerName, _missionPosition, format["%1 Mission", _vehicleName]] call createClientMarker;

[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>%1</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> has been immobilized; go get it for your team!</t>", _missionType, _vehiclePicture, _vehicleName, "#52bf90", "#FFFFFF"]] call RE;

_missionGroup = createGroup civilian;
[_missionGroup, _missionPosition] spawn createMidGroup;

diag_log format["WASTELAND SERVER - %1 Waiting to Be Finished (%2)", _missionType, _vehicleName];

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

    _unitsAlive = ({alive _x} count units _missionGroup);

    (_missionResult == 1) OR (_unitsAlive < 1)
};

if(_missionResult == 1) then {
    {
        deleteVehicle _x;
    } forEach units _missionGroup;
    deleteGroup _missionGroup;

	[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _vehiclePicture, _vehicleName, "#FF1717", "#FFFFFF"]] call RE;

    diag_log format["WASTELAND SERVER - %1 Failed (%2)", _missionType, _vehicleName];
}
else {
    deleteGroup _missionGroup;

	[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The <t color='%4'>%3</t> has been captured.</t>", _missionType, _vehiclePicture, _vehicleName, "#17FF41", "#FFFFFF"]] call RE;

    diag_log format["WASTELAND SERVER - %1 Success (%2)", _missionType, _vehicleName];

    sleep 3;

    _vehicle = [_missionPosition, random 360, _vehicleClass, true, false, -1] call spawnVehicle;
};

sleep 10;

MissionSpawnMarkers select _missionSpawnMarkerIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;
