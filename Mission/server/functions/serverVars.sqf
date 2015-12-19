//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19

if(!isServer) exitWith { };

diag_log format["Initializing Server Variables..."];

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

missionNumber = 1;
teamSwitchList = [];
publicVariable "teamSwitchList";
teamKillList = [];
publicVariable "teamKillList";
spawnBeaconsBluFor = [];
publicVariable "spawnBeaconsBluFor";
spawnBeaconsOpFor = [];
publicVariable "spawnBeaconsOpFor";
spawnBeaconsIndependent = [];
publicVariable "spawnBeaconsIndependent";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";

numberOfBoatSpawns = 24;
numberOfHelicopterSpawns = 90;

vehicleCategories = [
    ["Civilian", 25, [
        // ATV / Motorbikes / Tractors
        ["ATV_US_EP1", "Old_moto_TK_Civ_EP1", "TT650_Ins", "TT650_Civ", "M1030", "TT650_TK_EP1", "Tractor", "tractorOld", "TowingTractor"],
        // Cars
        ["S1203_TK_CIV_EP1", "car_hatchback", "VWGolf", "Skoda", "SkodaBlue", "SkodaGreen", "SkodaRed", "Lada1_TK_CIV_EP1", "Lada2_TK_CIV_EP1", "Volha_1_TK_CIV_EP1", "Volha_2_TK_CIV_EP1", "VolhaLimo_TK_CIV_EP1", "car_sedan", "LadaLM", "Lada1", "Lada2"],
        // Busses
        ["Ikarus", "Ikarus_TK_CIV_EP1"],
        // Humvees
        ["HMMWV"],
        // Offroads
        ["BAF_Offroad_W", "LandRover_TK_CIV_EP1", "hilux1_civil_1_open", "hilux1_civil_2_covered", "hilux1_civil_3_open", "datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open"],
        // SUV
        ["SUV_PMC"],
        // UAZ
        ["UAZ_CDF", "UAZ_RU", "UAZ_INS", "UAZ_Unarmed_TK_CIV_EP1", "UAZ_Unarmed_UN_EP1"],
        // Urals
        ["Ural_UN_EP1", "Ural_TK_CIV_EP1", "UralCivil2", "UralCivil", "Ural_Ins", "Ural_CDF", "UralOpen_INS", "UralOpen_CDF", "Kamaz", "KamazOpen", "V3S_Civ", "V3S_TK_EP1", "V3S_TK_GUE_EP1", "V3S_Open_TK_EP1", "V3S_Open_TK_CIV_EP1", "MTVR"],
        // Armored Vehicles
        ["GAZ_Vodnik","BTR40_TK_GUE_EP1", "BTR40_TK_INS_EP1"]
    ]],
    ["Utility Vehicles", 8, [
        // Ammo Trucks
        ["MtvrReammo", "WarfareReammoTruck_Gue", "UralReammo_TK_EP1", "UralReammo_INS", "UralReammo_CDF", "KamazReammo", "V3S_Reammo_TK_Gue_EP1"],
        // Fuel Trucks
        ["MtvrRefuel", "UralRefuel_INS", "UralRefuel_TK_EP1", "UralRefuel_CDF", "KamazRefuel", "V3S_Refuel_TK_GUE_EP1"],
        // Repair Trucks
        ["MtvrRepair", "UralRepair_CDF", "UralRepair_INS", "UralRepair_TK_EP1", "KamazRepair", "V3S_Repair_TK_GUE_EP1"],
        // Ambulances
        ["HMMWV_Ambulance", "S1203_ambulance_EP1", "GAZ_Vodnik_MedEvac", "M1133_MEV_EP1", "M113Ambul_TK_EP1", "BMP2_Ambul_INS", "BMP2_Ambul_CDF"]
    ]],
    ["Light Armored Vehicles", 54, [
        // CROWS
        ["HMMWV_M998_crows_M2_DES_EP1", "HMMWV_M998_crows_MK19_DES_EP1"],
        // Mk19 / AGS30 Technicals
        ["M1126_ICV_mk19_EP1", "HMMWV_MK19", "UAZ_AGS30_CDF", "UAZ_AGS30_INS", "UAZ_AGS30_RU", "UAZ_AGS30_TK_EP1"],
        //  Armored SUV / PKT / DShKM Technicals
        ["ArmoredSUV_PMC", "Pickup_PK_INS", "Pickup_PK_GUE", "UAZ_MG_INS", "UAZ_MG_TK_EP1", "UAZ_MG_CDF", "Offroad_DSHKM_TK_GUE_EP1", "Offroad_DSHKM_INS", "Offroad_DSHKM_GUE", "BTR40_MG_TK_GUE_EP1", "BTR40_MG_TK_INS_EP1"],
        // SPG-9 Technicals
        ["UAZ_SPG9_INS", "LandRover_SPG9_TK_EP1", "LandRover_SPG9_TK_INS_EP1", "Offroad_SPG9_Gue", "Offroad_SPG9_TK_GUE_EP1"],
        // M2 / M240 Technicals
        ["M1126_ICV_M2_EP1", "HMMWV_M2", "HMMWV_Armored", "LandRover_MG_TK_INS_EP1", "LandRover_MG_TK_EP1"],
        // Multi-Purpose Technicals
        ["LandRover_Special_CZ_EP1", "BAF_Jackal2_L2A1_W", "BAF_Jackal2_GMG_W"],
        // Anti-Air Vehicles
        ["HMMWV_Avenger"],
        // Anti-Tank Vehicles
        ["HMMWV_TOW", "M1135_ATGMV_EP1", "BRDM2_ATGM_TK_EP1", "BRDM2_ATGM_CDF", "BRDM2_ATGM_INS"],
        // ZU-23 Urals
        ["Ural_ZU23_Gue", "Ural_ZU23_INS", "Ural_ZU23_TK_GUE_EP1", "Ural_ZU23_CDF", "Ural_ZU23_TK_EP1"],
        // BRDM2
        ["BRDM2_Gue", "BRDM2_CDF", "BRDM2_INS", "BRDM2_TK_GUE_EP1", "BRDM2_TK_EP1"]
    ]],
    ["Medium Armored Vehicles", 11, [
        // Light APCs
        ["BMP2_CDF", "BMP2_TK_EP1", "BMP2_INS", "BMP2_Gue", "BTR60_TK_EP1", "GAZ_Vodnik_HMG", "AAV", "M113_TK_EP1"],
        // Light Tanks
        ["T34", "T34_TK_EP1", "T55_TK_EP1", "T55_TK_GUE_EP1"],
        // Medium Tanks
        ["T72_TK_EP1", "T72_Gue", "T72_CDF", "T72_RU", "T72_INS", "M1128_MGS_EP1"],
        // Anti-Air Tanks
        ["ZSU_TK_EP1", "ZSU_CDF", "ZSU_INS"],
        // LAV-25
        ["LAV25"],
        // BTR-90
        ["BTR90"],
        // BMP-3
        ["BMP3"],
        // Bradley
        ["M2A3_EP1"],
        // Linebacker
        ["M6_EP1"]
    ]],
    ["Heavy Armored Vehicles", 2, [
        // Heavy APCs
        ["BAF_FV510_W"],
        // Heavy Anti-Air
        ["2S6M_Tunguska"],
        // T90
        ["T90"],
        // M1A1 / M1A2
        ["M1A1", "M1A2_TUSK_MG"]
    ]]
];

helicopterCategories = [
    ["Light Helicopters", 8, [
        // UH1H
        ["UH1H_TK_EP1", "UH1H_TK_GUE_EP1"],
        // Mi-8 / Mi-17 Medevac
        ["Mi17_medevac_CDF", "Mi17_medevac_RU", "Mi17_medevac_Ins"]
    ]],
    ["Transport Helicopters", 35, [
        // Chinook
        ["CH_47F_EP1"],
        // Black Hawk
        ["UH60M_EP1"],
        // Osprey
        ["MV22"],
        // Mi-8 / Mi-17
        ["Mi17_CDF", "Mi17_TK_EP1", "Mi17_Ins", "Mi171Sh_CZ_EP1"]
    ]],
    ["Light Attack Helicopters", 55, [
        // Little Bird
        ["AH6J_EP1"],
        // Venom
        ["UH1Y"],
        // Ka60
        ["Ka60_PMC", "Ka60_GL_PMC"]
    ]],
    ["Heavy Attack Helicopters", 2, [
        ["Mi17_rockets_RU", "Mi171Sh_rockets_CZ_EP1"]
    ]]
];

boatCategories = [
    // RHIB Boats
    ["RHIB Boats", 50, [
        ["RHIB", "RHIB2Turret"]
    ]],
    // PBX Boats
    ["PBX Boats", 40, [
        ["PBX", "Zodiac", "SeaFox"]
    ]],
    // Boats
    ["Civilian Boats", 10, [
        ["Fishing_Boat", "Smallboat_1", "smallboat_2"]
    ]]
];

weaponCrateTypes = [
    "BasicGER",
    "BasicRU",
    "BasicUS",
    "GuerillaCache",
    "BasicTerrorist",
    "DemoCrate",
    "RUSniper",
    "USLaunchers",
    "RULaunchers",
    "USSniper",
    "USSpecialWeapons",
    "RUSpecialWeapons",
    "BAFSpecial"
];

weaponCrateCategories = [
    ["Basic Weapon Crates", 85, [
        ["BasicGER", "BasicRU", "BasicUS", "GuerillaCache", "BasicTerrorist", "DemoCrate", "RUSniper"]
    ]],
    ["Launcher Crates", 10, [
        ["USLaunchers", "RULaunchers"]
    ]],
    ["Special Crates", 5, [
        ["USSniper", "USSpecialWeapons", "RUSpecialWeapons", "BAFSpecial"]
    ]]
];

stationaryWeaponCategories = [
    ["Machine Guns", 35, [
        // Tall Tripods
        ["DSHKM_CDF", "KORD_high", "BAF_L2A1_Tripod_W", "M2StaticMG"],
        // Mini-Tripods
        ["DSHkM_Mini_TriPod", "BAF_GPMG_Minitripod_W", "KORD", "BAF_L2A1_Minitripod_W", "M2HD_mini_TriPod"]
    ]],
    ["Machine Gun Nests", 20, [
        // Machine Gun Nests
        ["Fort_Nest_M240", "CDF_WarfareBMGNest_PK"]
    ]],
    ["Grenade Launchers", 25, [
        // AGS-30 / Mk19 / GMG
        ["AGS_CDF", "MK19_TriPod", "BAF_GMG_Tripod_W"]
    ]],
    ["Anti-Tank Launchers", 10, [
        // Metis / TOW
        ["Metis", "TOW_TriPod"],
        // SPG-9
        ["SPG9_CDF"]
    ]],
    ["Anti-Air Launchers", 10, [
        // Stinger / Igla Pod
        ["Igla_AA_pod_East", "Stinger_Pod"],
        // ZU-23
        ["ZU23_CDF"]
    ]]
];

buildingCategories = [
    ["Containers", 15, [
        ["Fort_Crate_wood", "Misc_cargo_cont_tiny"]
    ]],
    ["Walls", 35, [
        // Concrete Wall
        ["Concrete_Wall_EP1"],
        // Hesco
        ["Base_WarfareBBarrier10xTall", "Base_WarfareBBarrier10x", "Base_WarfareBBarrier5x", "Land_HBarrier_large"],
        // Sandbags
        ["Land_fort_bagfence_long", "Land_fort_bagfence_round", "Land_fort_bagfence_corner", "Land_BagFenceLong", "Land_fortified_nest_small_EP1", "Land_fortified_nest_big"]
    ]],
    ["Buildings", 50, [
        [
            // Bridge
            "Land_prebehlavka",
            // ???
            "Land_leseni2x",
            // Deer Stand
            "Land_Misc_deerstand",
            // ???
            "Fort_Barricade",
            // ???
            "Land_fort_artillery_nest",
            // Dirt Ramp
            "Land_fort_rampart",
            // ???
            "Land_fort_rampart_EP1",
            // Scaffolding
            "Land_Misc_Scaffolding",
            // Sniper Nest
            "Land_Fort_Watchtower",
            // ???
            "Land_Fort_Watchtower_EP1",
            // Steel Hedgehog
            "Hedgehog",
            // Depot
            "WarfareBDepot",
            // Camp
            "WarfareBCamp",
            // Small Concrete Ramp
            "RampConcrete",
            // Big Concrete Ramp
            "Land_ConcreteRamp",
            // Concrete Block
            "Land_ConcreteBlock",
            // ???
            "Land_CncBlock_Stripes",
            // Wood Guard Shed
            "Land_GuardShed",
            // ???
            "Land_tent_east"
        ]
    ]]
];

randomWeapons = [
    ["Pistols", 5, [
        ["Colt1911"],
        ["M9", "M9SD"],
        ["glock17_EP1"],
        ["Makarov", "MakarovSD"],
        ["UZI_EP1", "UZI_SD_EP1"],
        ["Sa61_EP1"],
        ["revolver_EP1", "revolver_gold_EP1"]
    ]],
    ["Sub-Machine Guns & Shotguns", 5, [
        ["MP5A5", "MP5SD"],
        ["bizon", "bizon_silenced"],
        ["M1014", "Saiga12K", "AA12_PMC"]
    ]],
    ["Rifles", 40, [
        ["LeeEnfield"],
        ["M16A2", "M16A2GL", "m16a4", "M16A4_GL", "m16a4_acg", "M16A4_ACG_GL"],
        ["M4A1", "M4A1_Aim", "M4A1_Aim_camo", "M4A1_RCO_GL", "M4A1_HWS_GL", "M4A1_HWS_GL_CAMO", "M4A1_AIM_SD_camo", "M4A1_HWS_GL_SD_Camo", "M4A3_CCO_EP1", "M4A3_RCO_GL_EP1"],
        ["BAF_L85A2_RIS_Holo", "BAF_L85A2_UGL_Holo", "BAF_L85A2_RIS_ACOG", "BAF_L85A2_UGL_ACOG", "BAF_L85A2_RIS_CWS", "BAF_L85A2_RIS_SUSAT", "BAF_L85A2_UGL_SUSAT"],
        ["m8_carbine", "m8_carbineGL", "m8_compact", "m8_compact_pmc", "m8_carbine_pmc", "m8_holo_sd", "m8_tws", "m8_tws_sd"],
        ["G36A", "G36A_camo","G36C", "G36C_camo", "G36_C_SD_camo", "G36_C_SD_Eotech", "G36K", "G36K_camo"],
        ["AK_74", "AK_74_GL", "AK_74_GL_kobra", "AKS_74", "AKS_74_kobra", "AKS_74_pso", "AKS_74_U", "AKS_74_UN_Kobra", "AKS_74_GOSHAWK", "AK_107_Kobra", "AK_107_GL_kobra", "AK_107_pso", "AK_107_GL_pso"],
        ["AK_47_M", "AK_47_S", "AKS_GOLD", "Sa58P_EP1", "Sa58V_EP1", "Sa58V_CCO_EP1", "Sa58V_RCO_EP1"],
        ["SCAR_L_STD_EGLM_TWS", "SCAR_L_CQC_CCO_SD", "SCAR_L_CQC", "SCAR_L_CQC_Holo", "SCAR_L_CQC_EGLM_Holo", "SCAR_L_STD_HOLO", "SCAR_L_STD_EGLM_RCO", "SCAR_H_STD_EGLM_Spect", "SCAR_L_STD_Mk4CQT"],
        ["SCAR_H_CQC_CCO", "SCAR_H_CQC_CCO_SD", "SCAR_H_STD_TWS_SD"],
        ["FN_FAL"],
        ["M14_EP1"]
    ]],
    ["Machine Guns", 20, [
        ["Mk_48", "Mk_48_DES_EP1", "M240", "m240_scoped_EP1", "BAF_L7A2_GPMG", "M60A4_EP1"],
        ["M249", "M249_TWS_EP1", "M249_EP1", "M249_m145_EP1", "BAF_L110A1_Aim"],
        ["BAF_L86A2_ACOG", "m8_SAW", "MG36", "MG36_camo"],
        ["RPK_74"],
        ["PK", "Pecheneg"]
    ]],
    ["Sniper Rifles", 14, [
        ["VSS_vintorez"],
        ["huntingrifle"],
        ["M24", "M24_des_EP1", "M40A3"],
        ["M4SPR", "m8_sharpshooter"],
        ["SCAR_H_LNG_Sniper", "SCAR_H_LNG_Sniper_SD", "M110_TWS_EP1"],
        ["DMR"],
        ["SVD", "SVD_CAMO", "SVD_des_EP1"],
        ["ksvk"],
        ["BAF_AS50_scoped", "BAF_AS50_TWS"],
        ["m107", "m107_TWS_EP1"],
        ["BAF_LRR_scoped_W", "BAF_LRR_scoped"]
    ]],
    ["Anti-Tank Launchers", 14, [
        ["RPG7V", "RPG18"],
        ["M136"],
        ["MAAWS"],
        ["SMAW"],
        ["BAF_NLAW_Launcher", "M47Launcher_EP1"]
    ]],
    ["Anti-Air Launchers", 2, [
        ["Stinger", "Igla", "Strela"]
    ]]
];

geoCacheLocations = [
    ["GeoCache_1", false],
    ["GeoCache_2", false],
    ["GeoCache_3", false],
    ["GeoCache_4", false],
    ["GeoCache_5", false],
    ["GeoCache_6", false],
    ["GeoCache_7", false],
    ["GeoCache_8", false],
    ["GeoCache_9", false],
    ["GeoCache_10", false],
    ["GeoCache_11", false],
    ["GeoCache_12", false],
    ["GeoCache_13", false],
    ["GeoCache_14", false],
    ["GeoCache_15", false],
    ["GeoCache_16", false],
    ["GeoCache_17", false],
    ["GeoCache_18", false],
    ["GeoCache_19", false],
    ["GeoCache_20", false],
    ["GeoCache_21", false],
    ["GeoCache_22", false],
    ["GeoCache_23", false],
    ["GeoCache_24", false],
    ["GeoCache_25", false]
];

vehicleMissionLocations = [
    ["Mission_1", false],
    ["Mission_2", false],
    ["Mission_3", false],
    ["Mission_4", false],
    ["Mission_5", false],
    ["Mission_6", false],
    ["Mission_7", false],
    ["Mission_8", false],
    ["Mission_9", false],
    ["Mission_10", false],
    ["Mission_11", false],
    ["Mission_12", false],
    ["Mission_13", false],
    ["Mission_14", false],
    ["Mission_15", false],
    ["Mission_16", false],
    ["Mission_17", false],
    ["Mission_18", false],
    ["Mission_19", false],
    ["Mission_20", false],
    ["Mission_21", false],
    ["Mission_22", false],
    ["Mission_23", false],
    ["Mission_24", false],
    ["Mission_25", false],
    ["Mission_26", false],
    ["Mission_27", false],
    ["Mission_28", false],
    ["Mission_29", false],
    ["Mission_30", false],
    ["Mission_31", false],
    ["Mission_32", false],
    ["Mission_33", false],
    ["Mission_34", false],
    ["Mission_35", false],
    ["Mission_36", false],
    ["Mission_37", false],
    ["Mission_38", false],
    ["Mission_39", false],
    ["Mission_40", false],
    ["Mission_41", false],
    ["Mission_42", false],
    ["Mission_43", false],
    ["Mission_44", false],
    ["Mission_45", false],
    ["Mission_46", false],
    ["Mission_47", false],
    ["Mission_48", false],
    ["Mission_49", false],
    ["Mission_50", false]
];

missionTypes = [
    [1, "Main Battle Tank Mission", 0, [4, 1, 1, 2, 2], 600, 1800, vehicleMissionLocations, [
        ["BAF_FV510_W", "T90", "M1A2_TUSK_MG"]
    ]],
    [1, "Armored Personnel Carrier Mission", 0, [4, 1, 1, 1, 1], 300, 1800, vehicleMissionLocations, [
        ["BMP3", "M2A3_EP1", "M6_EP1"]
    ]],
    [1, "Anti-Air Mission", 0, [4, 1, 1, 2, 2], 900, 1800, vehicleMissionLocations, [
        ["2S6M_Tunguska"]
    ]],
    [1, "Attack Helicopter Mission", 0, [2, 4, 2, 2, 2], 1200, 1800, vehicleMissionLocations, [
        ["Mi171Sh_rockets_CZ_EP1", "Mi17_rockets_RU"],
        ["Mi24_D", "Mi24_D_TK_EP1"],
        ["Mi24_V"],
        ["Mi24_P"]
    ]],
    [2, "Geo Cache Mission", 1, 300, 2, 3, geoCacheLocations,
        ["BasicGER", "BasicRU", "BasicUS", "GuerillaCache", "BasicTerrorist", "DemoCrate", "RUSniper", "USLaunchers", "RULaunchers"]
    ]
];

aiClasses = [
    // Rifleman
    "Woodlander3",
    // Machine Gunner
    "Woodlander1",
    // Sniper
    "Woodlander4",
    // Anti-Tank
    "Citizen1",
    // Anti-Air
    "Pilot"
];

specialVehicles = [
    // Ammo Trucks
    "MtvrReammo",
    "WarfareReammoTruck_Gue",
    "UralReammo_TK_EP1",
    "UralReammo_INS",
    "UralReammo_CDF",
    "KamazReammo",
    "V3S_Reammo_TK_Gue_EP1",
    // Fuel Trucks
    "MtvrRefuel",
    "UralRefuel_INS",
    "UralRefuel_TK_EP1",
    "UralRefuel_CDF",
    "KamazRefuel",
    "V3S_Refuel_TK_GUE_EP1",
    // Repair Trucks
    "MtvrRepair",
    "UralRepair_CDF",
    "UralRepair_INS",
    "UralRepair_TK_EP1",
    "KamazRepair",
    "V3S_Repair_TK_GUE_EP1",
    // Ambulances
    "HMMWV_Ambulance",
    "S1203_ambulance_EP1",
    "GAZ_Vodnik_MedEvac",
    "M1133_MEV_EP1",
    "M113Ambul_TK_EP1",
    "BMP2_Ambul_INS",
    "BMP2_Ambul_CDF",
    // Armored Personnel Carriers
    "LAV25",
    "BTR90",
    "BMP2_CDF",
    "BMP2_TK_EP1",
    "BMP2_INS",
    "BMP2_Gue",
    "BMP2_UN_EP1",
    "BMP3",
    "M2A2_EP1",
    "M2A3_EP1",
    "M6_EP1",
    // Anti-Air
    "ZSU_TK_EP1",
    "ZSU_CDF",
    "ZSU_INS",
    "2S6M_Tunguska",
    // Main Battle Tanks
    "M1128_MGS_EP1",
    "T72_TK_EP1",
    "T72_Gue",
    "T72_CDF",
    "T72_RU",
    "T72_INS",
    "BAF_FV510_W",
    "BAF_FV510_D",
    "T90",
    "M1A1",
    "M1A1_US_DES_EP1",
    "M1A2_TUSK_MG",
    "M1A2_US_TUSK_MG_EP1",
    // Attack Helicopters
    "Mi171Sh_rockets_CZ_EP1",
    "Mi17_rockets_RU",
    "Mi24_D",
    "Mi24_D_TK_EP1",
    "Mi24_V",
    "Mi24_P",
    "Ka52",
    "Ka52Black",
    "AW159_Lynx_BAF",
    "AH1Z",
    "AH64D",
    "AH64D_EP1",
    "BAF_Apache_AH1_D",
    // Jets
    "MQ9PredatorB",
    "MQ9PredatorB_US_EP1",
    "L39_TK_EP1",
    "Su39",
    "Su25_INS",
    "Su25_CDF",
    "Su25_TK_EP1",
    "Su34",
    "A10",
    "A10_US_EP1",
    "AV8B",
    "AV8B2",
    "F35B"
];
