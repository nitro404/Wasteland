//  @file Version: 1.0
//  @file Name: spawnWeaponCrate.sqf
//  @file Author: nitro glycerine
//  @file Created: 25/08/2015 12:25 AM
//  @file Args: [position, direction, category] call spawnWeaponCrate;
//              ie. [[510, 307, 0], 304, weaponCrateCategories] call spawnWeaponCrate;
//              [position, direction, type] call spawnWeaponCrate;
//              ie. [[38, 142, 0], 27, "RUSniper"] call spawnWeaponCrate;

if(!isServer) exitWith { };

private["_weaponCrateType", "_weaponCrateCategory", "_weaponCratePosition", "_weaponCrate", "_invalidArgument"];

if(count _this < 3) exitWith {
    diag_log format["spawnWeaponCrate Error: Requires minimum of 3 arguments, received %1.", count _this]
};

_weaponCratePosition = _this select 0;
_weaponCrateDirection = _this select 1;
_weaponCrateType = nil;
_weaponCrateCategory = nil;
_weaponCrate = nil;
_invalidArgument = false;

if(typeName _weaponCratePosition != "ARRAY") exitWith {
    diag_log format["spawnWeaponCrate Arg0 Error: Invalid position argument - expected array, received %1.", typeName _weaponCratePosition]
};

if(typeName _weaponCrateDirection != "SCALAR") exitWith {
    diag_log format["spawnWeaponCrate Arg1 Error: Invalid direction argument - expected scalar, received %1.", typeName _weaponCrateDirection]
};

if(typeName (_this select 2) == "ARRAY") then {
    _weaponCrateCategory = _this select 2;
}
else {
    if(typeName (_this select 2) == "STRING") then {
        _weaponCrateType = _this select 2;
    }
    else {
        diag_log format["spawnWeaponCrate Arg2 Error: Invalid category / type argument - expected array or string, received %1.", typeName (_this select 2)];

        _invalidArgument = true;
    };
};

if(_invalidArgument) exitWith { };

if(isNil "_weaponCrateType") then {
    _weaponCrateType = [_weaponCrateCategory] call randomObject;
};

if(_weaponCrateType == "USLaunchers") exitWith {
    _weaponCrate = createVehicle["USLaunchersBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["Javelin", 2];
    _weaponCrate addWeaponCargoGlobal["M47Launcher_EP1", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_NLAW_Launcher", 2];
    _weaponCrate addWeaponCargoGlobal["Stinger", 2];
    _weaponCrate addWeaponCargoGlobal["SMAW", 2];
    _weaponCrate addWeaponCargoGlobal["MAAWS", 2];
    _weaponCrate addWeaponCargoGlobal["M136", 2];

    _weaponCrate addMagazineCargoGlobal["Javelin", 10];
    _weaponCrate addMagazineCargoGlobal["Dragon_EP1", 10];
    _weaponCrate addMagazineCargoGlobal["NLAW", 10];
    _weaponCrate addMagazineCargoGlobal["Stinger", 10];
    _weaponCrate addMagazineCargoGlobal["SMAW_HEAA", 20];
    _weaponCrate addMagazineCargoGlobal["SMAW_HEDP", 20];
    _weaponCrate addMagazineCargoGlobal["MAAWS_HEAT", 20];
    _weaponCrate addMagazineCargoGlobal["MAAWS_HEDP", 20];
    _weaponCrate addMagazineCargoGlobal["M136", 10];

    _weaponCrate
};

if(_weaponCrateType == "RULaunchers") exitWith {
    _weaponCrate = createVehicle["RULaunchersBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["MetisLauncher", 2];
    _weaponCrate addWeaponCargoGlobal["Igla", 2];
    _weaponCrate addWeaponCargoGlobal["Strela", 2];
    _weaponCrate addWeaponCargoGlobal["RPG18", 2];
    _weaponCrate addWeaponCargoGlobal["RPG7V", 2];

    _weaponCrate addMagazineCargoGlobal["AT13", 10];
    _weaponCrate addMagazineCargoGlobal["Igla", 10];
    _weaponCrate addMagazineCargoGlobal["Strela", 10];
    _weaponCrate addMagazineCargoGlobal["RPG18", 10];
    _weaponCrate addMagazineCargoGlobal["OG7", 10];
    _weaponCrate addMagazineCargoGlobal["PG7V", 10];
    _weaponCrate addMagazineCargoGlobal["PG7VL", 10];
    _weaponCrate addMagazineCargoGlobal["PG7VR", 10];

    _weaponCrate
};

if(_weaponCrateType == "DemoCrate") exitWith {
    _weaponCrate = createVehicle["USOrdnanceBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["M32_EP1", 5];
    _weaponCrate addWeaponCargoGlobal["M79_EP1", 5];
    _weaponCrate addWeaponCargoGlobal["Mk13_EP1", 5];
    _weaponCrate addWeaponCargoGlobal["M79_EP1", 5];

    _weaponCrate addMagazineCargoGlobal["6Rnd_HE_M203", 50];
    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_M203", 120];
    _weaponCrate addMagazineCargoGlobal["PipeBomb", 20];
    _weaponCrate addMagazineCargoGlobal["Mine", 20];
    _weaponCrate addMagazineCargoGlobal["PMC_ied_v4", 20];

    _weaponCrate
};

if(_weaponCrateType == "USSniper") exitWith {
    _weaponCrate = createVehicle["USSpecialWeapons_EP1", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["BAF_AS50_scoped", 2];
    _weaponCrate addWeaponCargoGlobal["m107", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_LRR_scoped_W", 2];
    _weaponCrate addWeaponCargoGlobal["M40A3", 2];
    _weaponCrate addWeaponCargoGlobal["DMR", 2];
    _weaponCrate addWeaponCargoGlobal["SCAR_H_LNG_Sniper", 2];
    _weaponCrate addWeaponCargoGlobal["m8_sharpshooter", 2];
    _weaponCrate addWeaponCargoGlobal["M4SPR", 2];
    _weaponCrate addWeaponCargoGlobal["PMC_AS50_TWS", 2];
    _weaponCrate addWeaponCargoGlobal["m107_TWS_EP1", 2];

    _weaponCrate addWeaponCargoGlobal["Binocular_Vector", 5];
    _weaponCrate addWeaponCargoGlobal["Laserdesignator", 5];

    _weaponCrate addMagazineCargoGlobal["5Rnd_127x99_as50", 50];
    _weaponCrate addMagazineCargoGlobal["10Rnd_127x99_m107", 50];
    _weaponCrate addMagazineCargoGlobal["5Rnd_86x70_L115A1", 30];
    _weaponCrate addMagazineCargoGlobal["5Rnd_762x51_M24", 30];
    _weaponCrate addMagazineCargoGlobal["20Rnd_762x51_DMR", 30];
    _weaponCrate addMagazineCargoGlobal["20Rnd_762x51_B_SCAR", 30];
    _weaponCrate addMagazineCargoGlobal["30Rnd_556x45_Stanag", 50];

    _weaponCrate addMagazineCargoGlobal["Laserbatteries", 5];

    _weaponCrate
};

if(_weaponCrateType == "RUSniper") exitWith {
    _weaponCrate = createVehicle["RUOrdnanceBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["ksvk", 10];
    _weaponCrate addWeaponCargoGlobal["SVD_CAMO", 2];
    _weaponCrate addWeaponCargoGlobal["SVD", 2];
    _weaponCrate addWeaponCargoGlobal["huntingrifle", 2];
    _weaponCrate addWeaponCargoGlobal["Binocular_Vector", 5];
    _weaponCrate addWeaponCargoGlobal["Laserdesignator", 5];

    _weaponCrate addMagazineCargoGlobal["5Rnd_127x108_KSVK", 130];
    _weaponCrate addMagazineCargoGlobal["10Rnd_762x54_SVD", 60];
    _weaponCrate addMagazineCargoGlobal["5x_22_LR_17_HMR", 30];

    _weaponCrate addMagazineCargoGlobal["Laserbatteries", 5];

    _weaponCrate
};

if(_weaponCrateType == "BasicGER") exitWith {
    _weaponCrate = createVehicle["GERBasicWeapons_EP1", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["G36_C_SD_camo", 4];
    _weaponCrate addWeaponCargoGlobal["G36a", 4];
    _weaponCrate addWeaponCargoGlobal["MG36", 4];
    _weaponCrate addWeaponCargoGlobal["G36A_camo", 4];
    _weaponCrate addWeaponCargoGlobal["G36C", 4];
    _weaponCrate addWeaponCargoGlobal["G36C_camo", 4];
    _weaponCrate addWeaponCargoGlobal["G36K", 4];

    _weaponCrate addMagazineCargoGlobal["30Rnd_556x45_G36SD", 60];
    _weaponCrate addMagazineCargoGlobal["30Rnd_556x45_G36", 340];

    _weaponCrate addMagazineCargoGlobal["Mine", 10];
    _weaponCrate addMagazineCargoGlobal["HandGrenade_West", 10];

    _weaponCrate
};

if(_weaponCrateType == "BasicRU") exitWith {
    _weaponCrate = createVehicle["RUBasicWeaponsBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["AKS_74_kobra", 4];
    _weaponCrate addWeaponCargoGlobal["AKS_GOLD", 4];
    _weaponCrate addWeaponCargoGlobal["AKS_74_pso", 4];
    _weaponCrate addWeaponCargoGlobal["AK_74_GL_kobra", 4];
    _weaponCrate addWeaponCargoGlobal["AKS_74_GOSHAWK", 4];
    _weaponCrate addWeaponCargoGlobal["SVD_CAMO", 4];

    _weaponCrate addWeaponCargoGlobal["Makarov", 4];
    _weaponCrate addWeaponCargoGlobal["MakarovSD", 4];
    _weaponCrate addWeaponCargoGlobal["Sa61_EP1", 4];

    _weaponCrate addMagazineCargoGlobal["30Rnd_545x39_AK", 200];
    _weaponCrate addMagazineCargoGlobal["30Rnd_762x39_AK47", 50];
    _weaponCrate addMagazineCargoGlobal["10Rnd_762x54_SVD", 30];

    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SMOKE_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeGreen_GP25", 10];

    _weaponCrate addMagazineCargoGlobal["8Rnd_9x18_Makarov", 40];
    _weaponCrate addMagazineCargoGlobal["8Rnd_9x18_MakarovSD", 40];
    _weaponCrate addMagazineCargoGlobal["20Rnd_B_765x17_Ball", 40];

    _weaponCrate addMagazineCargoGlobal["HandGrenade_East", 20];

    _weaponCrate
};

if(_weaponCrateType == "BasicUS") exitWith {
    _weaponCrate = createVehicle["USBasicWeaponsBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["m16a4", 4];
    _weaponCrate addWeaponCargoGlobal["m16a4_acg", 4];
    _weaponCrate addWeaponCargoGlobal["M16A4_ACG_GL", 4];
    _weaponCrate addWeaponCargoGlobal["M4A1_HWS_GL", 4];
    _weaponCrate addWeaponCargoGlobal["M249_TWS_EP1",4];
    _weaponCrate addWeaponCargoGlobal["M24", 4];

    _weaponCrate addWeaponCargoGlobal["M9", 5];
    _weaponCrate addWeaponCargoGlobal["M9SD", 5];

    _weaponCrate addMagazineCargoGlobal["30Rnd_556x45_Stanag", 200];
    _weaponCrate addMagazineCargoGlobal["200Rnd_556x45_M249", 30];
    _weaponCrate addMagazineCargoGlobal["5Rnd_762x51_M24", 50];

    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_M203", 40];

    _weaponCrate addMagazineCargoGlobal["15Rnd_9x19_M9", 50];
    _weaponCrate addMagazineCargoGlobal["15Rnd_9x19_M9SD", 50];

    _weaponCrate addMagazineCargoGlobal["BAF_L109A1_HE", 20];

    _weaponCrate
};

if(_weaponCrateType == "GuerillaCache") exitWith {
    _weaponCrate = createVehicle["GuerillaCacheBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["M47Launcher_EP1", 4];
    _weaponCrate addWeaponCargoGlobal["AK_107_kobra", 4];
    _weaponCrate addWeaponCargoGlobal["AK_107_pso", 4];
    _weaponCrate addWeaponCargoGlobal["AK_107_GL_pso", 4];

    _weaponCrate addMagazineCargoGlobal["Dragon_EP1", 10];

    _weaponCrate addMagazineCargoGlobal["30Rnd_545x39_AK", 150];

    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SMOKE_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeRed_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeGreen_GP25", 10];

    _weaponCrate addMagazineCargoGlobal["PipeBomb", 10];
    _weaponCrate addMagazineCargoGlobal["Mine", 10];
    _weaponCrate addMagazineCargoGlobal["HandGrenade_East", 20];

    _weaponCrate
};

if(_weaponCrateType == "BasicTerrorist") exitWith {
    _weaponCrate = createVehicle["TKBasicWeapons_EP1", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["Stinger", 2];

    _weaponCrate addWeaponCargoGlobal["AKS_74_kobra", 4];
    _weaponCrate addWeaponCargoGlobal["AKS_74_pso", 4];
    _weaponCrate addWeaponCargoGlobal["AK_74_GL", 4];
    _weaponCrate addWeaponCargoGlobal["LeeEnfield", 4];

    _weaponCrate addWeaponCargoGlobal["revolver_gold_EP1", 5];
    _weaponCrate addWeaponCargoGlobal["UZI_SD_EP1", 5];

    _weaponCrate addMagazineCargoGlobal["Stinger", 10];

    _weaponCrate addMagazineCargoGlobal["30Rnd_545x39_AK", 150];
    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SMOKE_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeGreen_GP25", 10];
    _weaponCrate addMagazineCargoGlobal["10x_303", 50];

    _weaponCrate addMagazineCargoGlobal["6Rnd_45ACP", 50];
    _weaponCrate addMagazineCargoGlobal["30Rnd_9x19_UZI_SD", 50];

    _weaponCrate addMagazineCargoGlobal["PipeBomb", 20];
    _weaponCrate addMagazineCargoGlobal["Mine", 10];
    _weaponCrate addMagazineCargoGlobal["HandGrenade", 20];

    _weaponCrate
};

if(_weaponCrateType == "USSpecialWeapons") exitWith {
    _weaponCrate = createVehicle["USSpecialWeaponsBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["M110_TWS_EP1", 2];
    _weaponCrate addWeaponCargoGlobal["SCAR_H_STD_TWS_SD", 2];
    _weaponCrate addWeaponCargoGlobal["SCAR_H_LNG_Sniper", 2];
    _weaponCrate addWeaponCargoGlobal["SCAR_H_LNG_Sniper_SD", 2];
    _weaponCrate addWeaponCargoGlobal["SCAR_H_CQC_CCO", 2];
    _weaponCrate addWeaponCargoGlobal["Mk13_EP1", 2];

    _weaponCrate addWeaponCargoGlobal["MAAWS", 2];

    _weaponCrate addWeaponCargoGlobal["Binocular_Vector", 5];
    _weaponCrate addWeaponCargoGlobal["Laserdesignator", 5];

    _weaponCrate addMagazineCargoGlobal["20Rnd_762x51_B_SCAR", 80];
    _weaponCrate addMagazineCargoGlobal["20Rnd_762x51_SB_SCAR", 50];

    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_M203", 40];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeRed_M203", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeGreen_M203", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeYellow_M203", 10];

    _weaponCrate addMagazineCargoGlobal["MAAWS_HEAT", 20];
    _weaponCrate addMagazineCargoGlobal["MAAWS_HEDP", 20];

    _weaponCrate addMagazineCargoGlobal["Laserbatteries", 5];
    _weaponCrate addMagazineCargoGlobal["HandGrenade", 10];

    _weaponCrate
};

if(_weaponCrateType == "RUSpecialWeapons") exitWith {
    _weaponCrate = createVehicle["RUSpecialWeaponsBox", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["MetisLauncher", 2];

    _weaponCrate addWeaponCargoGlobal["ksvk", 5];
    _weaponCrate addWeaponCargoGlobal["SVD_CAMO", 5];
    _weaponCrate addWeaponCargoGlobal["AKS_74_GOSHAWK", 2];
    _weaponCrate addWeaponCargoGlobal["AKS_74_pso", 2];
    _weaponCrate addWeaponCargoGlobal["bizon_silenced", 2];

    _weaponCrate addWeaponCargoGlobal["MakarovSD", 5];

    _weaponCrate addWeaponCargoGlobal["Binocular_Vector", 5];
    _weaponCrate addWeaponCargoGlobal["Laserdesignator", 5];

    _weaponCrate addMagazineCargoGlobal["AT13", 20];

    _weaponCrate addMagazineCargoGlobal["5Rnd_127x108_KSVK", 80];
    _weaponCrate addMagazineCargoGlobal["10Rnd_762x54_SVD", 80];
    _weaponCrate addMagazineCargoGlobal["30Rnd_545x39_AK", 50];
    _weaponCrate addMagazineCargoGlobal["64Rnd_9x19_SD_Bizon", 30];

    _weaponCrate addMagazineCargoGlobal["8Rnd_9x18_MakarovSD", 50];

    _weaponCrate addMagazineCargoGlobal["Laserbatteries", 5];

    _weaponCrate
};

if(_weaponCrateType == "BAFSpecial") exitWith {
    _weaponCrate = createVehicle["BAF_BasicWeapons", _weaponCratePosition, [], 0, "NONE"];

    clearMagazineCargoGlobal _weaponCrate;
    clearWeaponCargoGlobal _weaponCrate;

    _weaponCrate addWeaponCargoGlobal["BAF_AS50_scoped", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_LRR_scoped_W", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_L85A2_RIS_ACOG", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_L85A2_RIS_CWS", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_L85A2_UGL_ACOG", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_L86A2_ACOG", 2];
    _weaponCrate addWeaponCargoGlobal["BAF_L110A1_Aim", 2];
    _weaponCrate addWeaponCargoGlobal["AA12_PMC", 2];

    _weaponCrate addMagazineCargoGlobal["5Rnd_127x99_as50", 30];
    _weaponCrate addMagazineCargoGlobal["5Rnd_86x70_L115A1", 30];
    _weaponCrate addMagazineCargoGlobal["30Rnd_556x45_Stanag", 130];
    _weaponCrate addMagazineCargoGlobal["20Rnd_B_AA12_HE", 24];
    _weaponCrate addMagazineCargoGlobal["1Rnd_HE_M203", 20];
    _weaponCrate addMagazineCargoGlobal["1Rnd_Smoke_M203", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeRed_M203", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeGreen_M203", 10];
    _weaponCrate addMagazineCargoGlobal["1Rnd_SmokeYellow_M203", 10];

    _weaponCrate
};
