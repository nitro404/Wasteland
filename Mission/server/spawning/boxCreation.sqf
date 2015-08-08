//	@file Version: 1.0
//	@file Name: boxCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 19/12/2012 23:19
//	@file Args: [string (selected weapon crate), array (position)]

if(!X_Server) exitWith { };

private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_selectedBox = _this select 0;
_selectedBoxPos = _this select 1;

switch(_selectedBox) do {
    case "basicUS": {
        _currBox = createVehicle["USBasicWeaponsBox", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["M16A2", 2];
        _currBox addWeaponCargoGlobal["M16A4", 2];
        _currBox addWeaponCargoGlobal["M16A2GL", 2];
        _currBox addWeaponCargoGlobal["M4A1_HWS_GL", 2];
        _currBox addWeaponCargoGlobal["M249_EP1", 2];
        _currBox addWeaponCargoGlobal["M24", 2];

        _currBox addWeaponCargoGlobal["M9", 4];
        _currBox addWeaponCargoGlobal["M9SD", 4];

        _currBox addMagazineCargoGlobal["30Rnd_556x45_Stanag", 100];
        _currBox addMagazineCargoGlobal["200Rnd_556x45_M249", 12];
        _currBox addMagazineCargoGlobal["5Rnd_762x51_M24", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
        _currBox addMagazineCargoGlobal["1Rnd_HE_M203", 16];
        _currBox addMagazineCargoGlobal["1Rnd_Smoke_M203", 16];

        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9", 32];
        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9SD", 32];
    };
    case "basicUS2": {
        _currBox = createVehicle["USBasicWeaponsBox", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["M4A1_RCO_GL", 2];
        _currBox addWeaponCargoGlobal["M4A1_AIM_SD_CAMO", 2];
        _currBox addWeaponCargoGlobal["M4A1_HWS_GL_CAMO", 2];
        _currBox addWeaponCargoGlobal["M4A1_HWS_GL_SD_CAMO", 2];
        _currBox addWeaponCargoGlobal["M4A3_CCO_EP1", 2];
        _currBox addWeaponCargoGlobal["M1014", 2];
        _currBox addWeaponCargoGlobal["m240_scoped_EP1", 2];
        _currBox addWeaponCargoGlobal["M4SPR", 2];
        _currBox addWeaponCargoGlobal["M40A3", 2];

        _currBox addWeaponCargoGlobal["Colt1911", 4];
        _currBox addWeaponCargoGlobal["Glock17_EP1", 4];

        _currBox addMagazineCargoGlobal["30Rnd_556x45_Stanag", 100];
        _currBox addMagazineCargoGlobal["30Rnd_556x45_StanagSD", 50];
        _currBox addMagazineCargoGlobal["100Rnd_762x51_M240", 10];
        _currBox addMagazineCargoGlobal["5Rnd_762x51_M24", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
        _currBox addMagazineCargoGlobal["1Rnd_HE_M203", 10];
        _currBox addMagazineCargoGlobal["1Rnd_Smoke_M203", 10];
        _currBox addMagazineCargoGlobal["8Rnd_B_Beneli_74Slug", 24];
        _currBox addMagazineCargoGlobal["8Rnd_B_Beneli_Pellets", 24];

        _currBox addMagazineCargoGlobal["7Rnd_45ACP_1911", 32];
        _currBox addMagazineCargoGlobal["17Rnd_9x19_glock17", 32];
    };
    case "basicRU": {
        _currBox = createVehicle["RUBasicWeaponsBox", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["AK_107_GL_kobra", 2];
        _currBox addWeaponCargoGlobal["AKS_74_U", 4];
        _currBox addWeaponCargoGlobal["Sa58V_CCO_EP1", 2];
        _currBox addWeaponCargoGlobal["RPK_74", 2];
        _currBox addWeaponCargoGlobal["ksvk", 2];

        _currBox addWeaponCargoGlobal["MakarovSD", 4];
        _currBox addWeaponCargoGlobal["Sa61_EP1", 4];

        _currBox addMagazineCargoGlobal["30Rnd_545x39_AK", 50];
        _currBox addMagazineCargoGlobal["30Rnd_762x39_SA58", 24];
        _currBox addMagazineCargoGlobal["75Rnd_545x39_RPK", 12];
        _currBox addMagazineCargoGlobal["8Rnd_9x18_MakarovSD", 24];
        _currBox addMagazineCargoGlobal["20Rnd_B_765x17_Ball", 24];
        _currBox addMagazineCargoGlobal["5Rnd_127x108_KSVK", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
        _currBox addMagazineCargoGlobal["1Rnd_HE_GP25", 24];
        _currBox addMagazineCargoGlobal["1Rnd_SMOKE_GP25", 24];
    };
    case "basicRU2": {
        _currBox = createVehicle["RUBasicWeaponsBox", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["AKS_GOLD", 4];
        _currBox addWeaponCargoGlobal["AK_47_M", 4];
        _currBox addWeaponCargoGlobal["AKS_74_GOSHAWK", 2];
        _currBox addWeaponCargoGlobal["AKS_74_kobra", 2];
        _currBox addWeaponCargoGlobal["AKS_74_pso", 2];
        _currBox addWeaponCargoGlobal["Saiga12K", 2];
        _currBox addWeaponCargoGlobal["SVD", 2];

        _currBox addWeaponCargoGlobal["MakarovSD", 4];
        _currBox addWeaponCargoGlobal["Makarov", 4];

        _currBox addMagazineCargoGlobal["30Rnd_545x39_AK", 100];
        _currBox addMagazineCargoGlobal["30Rnd_762x39_AK47", 50];
        _currBox addMagazineCargoGlobal["10Rnd_762x54_SVD", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
        _currBox addMagazineCargoGlobal["8Rnd_B_Saiga12_74Slug", 24];
        _currBox addMagazineCargoGlobal["8Rnd_B_Saiga12_Pellets", 24];

        _currBox addMagazineCargoGlobal["8Rnd_9x18_Makarov", 24];
        _currBox addMagazineCargoGlobal["8Rnd_9x18_MakarovSD", 24];
    };
    case "basicGER": {
        _currBox = createVehicle["GERBasicWeapons_EP1", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["G36C_camo", 2];
        _currBox addWeaponCargoGlobal["G36_C_SD_eotech", 2];
        _currBox addWeaponCargoGlobal["G36a", 2];
        _currBox addWeaponCargoGlobal["MG36", 2];
        _currBox addWeaponCargoGlobal["MP5A5", 2];
        _currBox addWeaponCargoGlobal["MP5SD", 2];

        _currBox addWeaponCargoGlobal["glock17_EP1", 4];
        _currBox addWeaponCargoGlobal["UZI_SD_EP1", 4];

        _currBox addMagazineCargoGlobal["30Rnd_9x19_MP5SD", 25];
        _currBox addMagazineCargoGlobal["30Rnd_9x19_MP5", 25];
        _currBox addMagazineCargoGlobal["30Rnd_556x45_G36", 50];
        _currBox addMagazineCargoGlobal["100Rnd_556x45_BetaCMag", 10];
        _currBox addMagazineCargoGlobal["30Rnd_556x45_G36SD", 30];
        _currBox addMagazineCargoGlobal["17Rnd_9x19_glock17", 24];
        _currBox addMagazineCargoGlobal["30Rnd_9x19_UZI_SD", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
    };
    case "basicPMC": {
        _currBox = createVehicle["Ammobox_PMC", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["M8_carbine", 2];
        _currBox addWeaponCargoGlobal["M8_carbineGL", 2];
        _currBox addWeaponCargoGlobal["m8_holo_sd", 2];
        _currBox addWeaponCargoGlobal["m8_SAW", 2];
        _currBox addWeaponCargoGlobal["AA12_PMC", 4];

        _currBox addWeaponCargoGlobal["M9", 4];
        _currBox addWeaponCargoGlobal["M9SD", 4];

        _currBox addMagazineCargoGlobal["30Rnd_556x45_Stanag", 50];
        _currBox addMagazineCargoGlobal["20Rnd_B_AA12_Pellets", 24];
        _currBox addMagazineCargoGlobal["20Rnd_B_AA12_74Slug", 24];
        _currBox addMagazineCargoGlobal["20Rnd_B_AA12_HE", 12];
        _currBox addMagazineCargoGlobal["30Rnd_556x45_StanagSD", 24];
        _currBox addMagazineCargoGlobal["100Rnd_556x45_BetaCMag_airLock", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
        _currBox addMagazineCargoGlobal["1Rnd_HE_M203", 12];
        _currBox addMagazineCargoGlobal["1Rnd_Smoke_M203", 12];

        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9SD", 24];
        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9", 24];
    };
    case "basicSpecial": {
        _currBox = createVehicle["SpecialWeaponsBox", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["m8_compact_pmc", 2];
        _currBox addWeaponCargoGlobal["m8_sharpshooter", 2];
        _currBox addWeaponCargoGlobal["SCAR_H_CQC_CCO", 4];
        _currBox addWeaponCargoGlobal["SCAR_L_STD_EGLM_TWS", 2];
        _currBox addWeaponCargoGlobal["SCAR_H_LNG_Sniper", 2];
        _currBox addWeaponCargoGlobal["SCAR_H_LNG_Sniper_SD", 2];

        _currBox addWeaponCargoGlobal["M40A3", 2];
        _currBox addWeaponCargoGlobal["DMR", 2];

        _currBox addWeaponCargoGlobal["UZI_SD_EP1", 4];
        _currBox addWeaponCargoGlobal["M9SD", 4];

        _currBox addMagazineCargoGlobal["30Rnd_556x45_Stanag", 72];
        _currBox addMagazineCargoGlobal["20Rnd_762x51_B_SCAR", 50];
        _currBox addMagazineCargoGlobal["20Rnd_762x51_SB_SCAR", 24];
        _currBox addMagazineCargoGlobal["1Rnd_HE_M203", 24];
        _currBox addMagazineCargoGlobal["1Rnd_Smoke_M203", 24];
        _currBox addMagazineCargoGlobal["5Rnd_762x51_M24", 24];
        _currBox addMagazineCargoGlobal["20Rnd_762x51_DMR", 24];

        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9SD", 24];
        _currBox addMagazineCargoGlobal["30Rnd_9x19_UZI_SD", 24];
    };
    case "basicSpecial2": {
        _currBox = createVehicle["SpecialWeaponsBox", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["BAF_L85A2_RIS_CWS", 2];
        _currBox addWeaponCargoGlobal["BAF_L85A2_RIS_ACOG", 2];
        _currBox addWeaponCargoGlobal["BAF_L86A2_ACOG", 2];
        _currBox addWeaponCargoGlobal["BAF_L85A2_UGL_SUSAT", 2];
        _currBox addWeaponCargoGlobal["BAF_L85A2_UGL_Holo", 2];
        _currBox addWeaponCargoGlobal["BAF_L110A1_Aim", 2];
        _currBox addWeaponCargoGlobal["BAF_LRR_scoped", 2];

        _currBox addWeaponCargoGlobal["glock17_EP1", 8];

        _currBox addMagazineCargoGlobal["30Rnd_556x45_Stanag", 100];
        _currBox addMagazineCargoGlobal["200Rnd_556x45_L110A1", 24];
        _currBox addMagazineCargoGlobal["BAF_L109A1_HE", 12];
        _currBox addMagazineCargoGlobal["1Rnd_HE_M203", 12];
        _currBox addMagazineCargoGlobal["1Rnd_Smoke_M203", 12];
        _currBox addMagazineCargoGlobal["5Rnd_86x70_L115A1", 24];

        _currBox addMagazineCargoGlobal["17Rnd_9x19_glock17", 24];
    };
    case "basicSpecial3": {
        _currBox = createVehicle["TKBasicWeapons_EP1", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["AK_47_S", 2];
        _currBox addWeaponCargoGlobal["LeeEnfield", 2];
        _currBox addWeaponCargoGlobal["FN_FAL", 2];
        _currBox addWeaponCargoGlobal["VSS_Vintorez", 2];
        _currBox addWeaponCargoGlobal["PK", 2];
        _currBox addWeaponCargoGlobal["huntingrifle", 2];
        _currBox addWeaponCargoGlobal["bizon_silenced", 2];

        _currBox addWeaponCargoGlobal["revolver_EP1", 4];
        _currBox addWeaponCargoGlobal["Colt1911", 4];

        _currBox addMagazineCargoGlobal["30Rnd_762x39_AK47", 50];
        _currBox addMagazineCargoGlobal["100Rnd_762x54_PK", 12];
        _currBox addMagazineCargoGlobal["5x_22_LR_17_HMR", 25];
        _currBox addMagazineCargoGlobal["64Rnd_9x19_SD_Bizon", 24];
        _currBox addMagazineCargoGlobal["20Rnd_762x51_FNFAL", 24];
        _currBox addMagazineCargoGlobal["10x_303", 50];
        _currBox addMagazineCargoGlobal["10Rnd_9x39_SP5_VSS", 24];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];

        _currBox addMagazineCargoGlobal["6Rnd_45ACP", 24];
        _currBox addMagazineCargoGlobal["7Rnd_45ACP_1911", 24];
    };
    case "mission_Mid_BAF": {
        _currBox = createVehicle["BAF_BasicWeapons", _selectedBoxPos, [], 30, "NONE"];

        clearMagazineCargoGlobal _currBox;
        clearWeaponCargoGlobal _currBox;

        _currBox addWeaponCargoGlobal["SVD_CAMO", 2];
        _currBox addWeaponCargoGlobal["M14_EP1", 2];
        _currBox addWeaponCargoGlobal["BAF_L7A2_GPMG", 1];
        _currBox addWeaponCargoGlobal["BAF_L110A1_Aim", 1];
        _currBox addWeaponCargoGlobal["BAF_L85A2_RIS_CWS", 1];
        _currBox addWeaponCargoGlobal["BAF_L85A2_RIS_Holo", 1];
        _currBox addWeaponCargoGlobal["BAF_L85A2_UGL_Holo", 1];
        _currBox addWeaponCargoGlobal["FN_FAL_ANPVS4", 1];
        _currBox addWeaponCargoGlobal["BAF_LRR_scoped", 2];

        _currBox addWeaponCargoGlobal["M9", 4];
        _currBox addWeaponCargoGlobal["M9SD", 4];

        _currBox addMagazineCargoGlobal["30Rnd_556x45_Stanag", 50];
        _currBox addMagazineCargoGlobal["100Rnd_762x51_M240", 12];
        _currBox addMagazineCargoGlobal["1Rnd_HE_M203", 12];
        _currBox addMagazineCargoGlobal["1Rnd_Smoke_M203", 12];
        _currBox addMagazineCargoGlobal["HandGrenade", 10];
        _currBox addMagazineCargoGlobal["200Rnd_556x45_L110A1", 12];
        _currBox addMagazineCargoGlobal["5Rnd_86x70_L115A1", 24];
        _currBox addMagazineCargoGlobal["20Rnd_762x51_DMR", 24];
        _currBox addMagazineCargoGlobal["20Rnd_762x51_FNFAL", 24];
        _currBox addMagazineCargoGlobal["10Rnd_762x54_SVD", 24];

        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9", 32];
        _currBox addMagazineCargoGlobal["15Rnd_9x19_M9SD", 32];
    };
};
