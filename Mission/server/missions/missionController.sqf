//  @file Version: 1.0
//  @file Name: missionController.sqf
//  @file Author: nitro glycerine
//  @file Created: 10/10/2015 4:30 PM
//  @file Args: [missionTypeInfo] spawn missionController;

if(!isServer) exitWith { };

private["_missionTypeInfo", "_missionFunctionType", "_missionFunction", "_vehicleList", "_vehicleClass", "_missionRewardPicture", "_minWeaponCrates", "_maxWeaponCrates", "_fullWeaponCrateList", "_missionSpawnLocations", "_numberOfWeaponCrates", "_weaponCrateSpawnList", "_activeMission"];

_missionTypeInfo = _this select 0;
_missionFunctionType = _missionTypeInfo select 2;

_controllerDelay = (random 240) + 60;

diag_log format["Delaying %1 Controller Initialization by %2 Minutes", _missionTypeInfo select 1, _controllerDelay / 60];

[_controllerDelay] call createWaitCondition;

while { true } do {
	if(_missionFunctionType == 0) then {
		_missionSpawnLocations = _missionTypeInfo select 6;
		_vehicleList = (_missionTypeInfo select 7) select (floor (random count (_missionTypeInfo select 7)));
		_vehicleClass = _vehicleList select (floor (random count _vehicleList));
		_missionRewardPicture = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "picture");
		_activeMission = [_missionTypeInfo select 1, _vehicleClass, _missionSpawnLocations, _missionTypeInfo select 3, _missionTypeInfo select 4, _missionTypeInfo select 5, missionNumber] spawn vehicleMission;

		diag_log format["Creating New %1 (%2)", _missionTypeInfo select 1, getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName")];

		[nil, nil, rHINT, parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>%1</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t color='%5' size='1.0'>Starting in %3 Minutes</t>", _missionTypeInfo select 1, _missionRewardPicture, floor((_missionTypeInfo select 4) / 60), "#52bf90", "#FFFFFF"]] call RE;
	};

	if(_missionFunctionType == 1) then {
		_minWeaponCrates = _missionTypeInfo select 4;
		_maxWeaponCrates = _missionTypeInfo select 5;
		_missionSpawnLocations = _missionTypeInfo select 6;
		_fullWeaponCrateList = _missionTypeInfo select 7;
		_numberOfWeaponCrates = floor (random (_maxWeaponCrates - _minWeaponCrates + 1) + _minWeaponCrates);
		_weaponCrateSpawnList = [];

		while { count _weaponCrateSpawnList < _numberOfWeaponCrates } do {
			[_weaponCrateSpawnList, _fullWeaponCrateList select (floor (random count _fullWeaponCrateList))] call BIS_fnc_arrayPush;
		};

		_activeMission = [_weaponCrateSpawnList, _missionSpawnLocations, _missionTypeInfo select 3, missionNumber] spawn geoCacheMission;

		diag_log format["Creating New Geo Cache Mission (%1)", _weaponCrateSpawnList];

		[nil, nil, rHINT, parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>%1</t><br/><t align='center' color='%3'>------------------------------</t><br/><t color='%4' size='1.0'>Starting in %2 Minutes</t>", _missionTypeInfo select 1, floor((_missionTypeInfo select 3) / 60), "#52bf90", "#FFFFFF"]] call RE;
	};

	missionNumber = missionNumber + 1;

	waitUntil {
		sleep 1;
		scriptDone _activeMission
	};

	sleep 5;
};
