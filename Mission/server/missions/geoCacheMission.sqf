//  @file Version: 1.0
//  @file Name: geoCacheMission.sqf
//  @file Author: nitro glycerine
//  @file Created: 12/10/2015 2:33 PM
//  @file Args: [weaponCrateList, missionNumber] spawn geoCacheMission;

#include "setup.sqf"

private["_weaponCrateList", "_weaponCrates", "_missionNumber", "_missionMarkerName", "_missionLocationData", "_missionPosition", "_missionSpawnMarkerIndex", "_playerPresent"];

if(!isServer) exitWith { };

_weaponCrateList = _this select 0;
_missionDelay = _this select 1;
_missionNumber = _this select 2;
_missionMarkerName = format["ActiveMission_%1", _missionNumber];

_missionLocationData = call createMissionLocation;
_missionPosition = _missionLocationData select 0;
_missionSpawnMarkerIndex = _missionLocationData select 1;

[_missionDelay] call createWaitCondition;

diag_log format["WASTELAND SERVER - Geo Cache Mission Started (%1)", _weaponCrateList];

[_missionMarkerName, _missionPosition, "Geo Cache"] call createClientMarker;

[nil, nil, rHINT, parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Geo Cache</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>A <t color='%1'>geo cache</t> has been located; go get it for your team!</t>", "#52bf90", "#FFFFFF"]] call RE;

diag_log format["WASTELAND SERVER - Spawning %1 Weapon Crates: %2", count _weaponCrateList, _weaponCrateList];

_weaponCrates = [];
{
    [_weaponCrates, [_missionPosition, random 360, _weaponCrateList select _forEachIndex] call spawnWeaponCrate] call BIS_fnc_arrayPush;
} forEach _weaponCrateList;

waitUntil {
    sleep 3;

    _playerPresent = false;
    {
        if((isPlayer _x) AND (_x distance _missionPosition <= 50)) then {
            _playerPresent = true
        };
    } forEach playableUnits;

    _playerPresent
};

[nil, nil, rHINT, parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>The <t color='%1'>geo cache</t> has been claimed.</t>", "#17FF41", "#FFFFFF"]] call RE;

diag_log format["WASTELAND SERVER - Geo Cache Mission Completed (%1)", _weaponCrateList];

sleep 10;

MissionSpawnMarkers select _missionSpawnMarkerIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;
