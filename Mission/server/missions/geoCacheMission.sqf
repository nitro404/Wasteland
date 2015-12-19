//  @file Version: 1.0
//  @file Name: geoCacheMission.sqf
//  @file Author: nitro glycerine
//  @file Created: 12/10/2015 2:33 PM
//  @file Args: [weaponCrateList, spawnLocations, delay, missionNumber] spawn geoCacheMission;

private["_weaponCrateList", "_weaponCrates", "_missionNumber", "_missionMarkerName", "_missionMarkerText", "_missionMarker", "_missionLocationData", "_missionPosition", "_missionSpawnMarkerIndex", "_playerPresent"];

if(!isServer) exitWith { };

_weaponCrateList = _this select 0;
_missionSpawnLocations = _this select 1;
_missionDelay = _this select 2;
_missionNumber = _this select 3;
_missionMarkerName = format["ActiveMission_%1", _missionNumber];
_missionMarkerText = "Geo Cache";

_missionLocationData = _missionSpawnLocations call createMissionLocation;
_missionPosition = _missionLocationData select 0;
_missionSpawnMarkerIndex = _missionLocationData select 1;

_missionDelay call createWaitCondition;

diag_log format["Geo Cache Mission Started (%1)", _weaponCrateList];

_missionMarker = createMarker [_missionMarkerName, _missionPosition];
_missionMarker setMarkerType "mil_destroy";
_missionMarker setMarkerSize [1.25, 1.25];
_missionMarker setMarkerColor "ColorRed";
_missionMarker setMarkerText _missionMarkerText;

[nil, nil, rHINT, parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Geo Cache</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>A <t color='%1'>geo cache</t> has been located; go get it for your team!</t>", "#52bf90", "#FFFFFF"]] call RE;

diag_log format["Spawning %1 Weapon Crates: %2", count _weaponCrateList, _weaponCrateList];

_weaponCrates = [];
{
    [_weaponCrates, [_missionPosition, random 360, _weaponCrateList select _forEachIndex] call spawnWeaponCrate] call BIS_fnc_arrayPush;
} forEach _weaponCrateList;

waitUntil {
    sleep 3;

    _playerPresent = false;

    {
        if(isPlayer _x && _x distance _missionPosition <= 50) exitWith {
            _playerPresent = true
        };
    } forEach playableUnits;

    _missionMarker setMarkerColor markerColor _missionMarker;

    _playerPresent
};

[nil, nil, rHINT, parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%1'>------------------------------</t><br/><t align='center' color='%2'>The <t color='%1'>geo cache</t> has been claimed.</t>", "#17FF41", "#FFFFFF"]] call RE;

diag_log format["Geo Cache Mission Completed (%1)", _weaponCrateList];

_missionMarker setMarkerColor "ColorGreen";

sleep 10;

deleteMarker _missionMarker;

_missionSpawnLocations select _missionSpawnMarkerIndex set[1, false];
