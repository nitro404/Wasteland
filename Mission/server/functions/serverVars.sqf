//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\

#include "setup.sqf"

if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initializing Server Vars"];

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = [];
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = [];
publicVariable "pvar_beaconListRed";
pvar_beaconListIndep = [];
publicVariable "pvar_beaconListIndep";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";

"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

staticHeliWrecks = [
    "UH1Wreck",
    "UH1Wreck",
    "Mi8Wreck",
    "Mi8Wreck",
    "C130J_wreck_EP1",
    "UH60_wreck_EP1",
    "UH60_wreck_EP1"
];

civilianVehicles = [
    "car_hatchback",
    "car_sedan",
    "datsun1_civil_2_covered",
    "SkodaGreen",
    "Lada2",
    "V3S_Civ",
    "UralCivil",
    "VWGolf",
    "MMT_Civ",
    "V3S_TK_GUE_EP1",
    "Ikarus_TK_CIV_EP1",
    "Lada1_TK_CIV_EP1",
    "Old_moto_TK_Civ_EP1",
    "S1203_TK_CIV_EP1",
    "UAZ_Unarmed_TK_CIV_EP1",
    "ATV_US_EP1",
    "BAF_Offroad_W",
    "S1203_ambulance_EP1",
    "tractorOld",
    "hilux1_civil_2_covered",
    "Lada2_TK_CIV_EP1",
    "HMMWV_M1035_DES_EP1",
    "LadaLM",
    "Tractor",
    "TT650_TK_EP1",
    "TT650_Gue",
    "M1030",
    "Kamaz",
    "LadaLM",
    "Lada1",
    "hilux1_civil_1_open",
    "VolhaLimo_TK_CIV_EP1",
    "UAZ_CDF",
    "SUV_PMC",
    "MTVR",
    "BAF_Offroad_W",
    "HMMWV",
    "HMMWV_Ambulance",
    "S1203_ambulance_EP1",
    "GAZ_Vodnik_MedEvac",
    "Ikarus"
];

militaryVehicles = [
    "ArmoredSUV_PMC",
    "Pickup_PK_GUE",
    "UAZ_MG_TK_EP1",
    "LandRover_MG_TK_INS_EP1",
    "HMMWV_M2",
    "HMMWV_Armored",
    "HMMWV_MK19",
    "HMMWV_TOW",
    "GAZ_Vodnik",
    "GAZ_Vodnik_HMG",
    "M1135_ATGMV_EP1",
    "M1126_ICV_MK19_EP1",
    "M1126_ICV_M2_EP1",
    "BTR40_MG_TK_GUE_EP1",
    "BTR60_TK_EP1",
    "BRDM2_CDF",
    "BRDM2_ATGM_CDF",
    "AAV",
    "HMMWV_M998_CROWS_M2_DES_EP1",
    "HMMWV_M998_CROWS_MK19_DES_EP1",
    "HMMWV_Avenger",
    "MtvrReammo",
    "MtvrRefuel",
    "MtvrRepair"
];

armedMilitaryVehicles = [
    "T34",
    "T55_TK_EP1",
    "ZSU_TK_EP1",
    "T72_RU",
    "M6_EP1",
    "M2A3_EP1",
    "M113_TK_EP1",
    "BMP2_CDF",
    "BMP3",
    "M1128_MGS_EP1",
    "LAV25",
    "BTR90"
];

objectList = [
    "Land_prebehlavka",
    "Land_leseni2x",
    "Fort_Crate_wood",
    "Base_WarfareBBarrier10xTall",
    "Base_WarfareBBarrier10x",
    "Base_WarfareBBarrier5x",
    "Base_WarfareBBarrier10xTall",
    "Base_WarfareBBarrier10x",
    "Base_WarfareBBarrier5x",
    "Land_Misc_deerstand",
    "Fort_Barricade",
    "Concrete_Wall_EP1",
    "Concrete_Wall_EP1",
    "Land_fort_bagfence_long",
    "Land_fort_bagfence_long",
    "Land_fort_bagfence_round",
    "Land_fort_bagfence_corner",
    "Land_BagFenceLong",
    "Land_BagFenceLong",
    "Land_fort_artillery_nest",
    "Land_fortified_nest_small_EP1",
    "Land_Misc_deerstand",
    "Land_fort_rampart",
    "Land_fort_rampart_EP1",
    "Land_HBarrier_large",
    "Land_HBarrier_large",
    "Land_Misc_Scaffolding",
    "Land_Fort_Watchtower_EP1",
    "Land_Fort_Watchtower",
    "Land_fortified_nest_big",
    "RampConcrete",
    "WarfareBDepot",
    "WarfareBCamp",
    "Hedgehog",
    "Land_ConcreteRamp",
    "Land_CncBlock_Stripes",
    "Land_GuardShed",
    "Land_tent_east",
    "Land_ConcreteBlock"
];

staticWeaponsList = [
    "M2StaticMG_US_EP1",
    "DSHKM_TK_INS_EP1",
    "BAF_L2A1_Tripod_D",
    "MK19_TriPod",
    "AGS_UN_EP1",
    "KORD_high",
    "Stinger_Pod_US_EP1",
    "Igla_AA_pod_East",
    "Metis_TK_EP1",
    "TOW_TriPod",
    "ZU23_TK_GUE_EP1",
    "SPG9_CDF"
];

staticHeliList = [
    "UH1H_TK_EP1",
    "UH1H_TK_GUE_EP1",
    "UH1Y",
    "UH60M_EP1",
    "CH_47F_EP1",
    "AH6J_EP1",
    "Ka60_GL_PMC",
    "Mi17_CDF",
    "Mi17_TK_EP1",
    "Mi171Sh_CZ_EP1",
    "MV22"
];

vehicleWeapons = [
    "M16A2",
    "M16A2GL",
    "M4A1",
    "M4A1_AIM_SD_camo",
    "M4A1_HWS_GL_SD_Camo",
    "M4A3_CCO_EP1",
    "AK_47_M",
    "AK_47_S",
    "AK_74",
    "AKS_74_kobra",
    "M14_EP1",
    "Sa58V_EP1",
    "Sa58V_CCO_EP1",
    "Sa58V_RCO_EP1",
    "SCAR_L_STD_HOLO",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_H_CQC_CCO",
    "FN_FAL",
    "M240",
    "M40A3",
    "M249",
    "M60A4_EP1",
    "Mk_48",
    "RPK_74",
    "PK",
    "Pecheneg",
    "AA12_PMC",
    "huntingrifle",
    "DMR",
    "SVD",
    "SVD_CAMO",
    "KSVK",
    "RPG7V",
    "RPG18",
    "M136",
    "MAAWS"
];

MissionSpawnMarkers = [
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
