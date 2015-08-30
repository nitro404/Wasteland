//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

//Gunstore Weapon List - Gun Store Base List
// Type, Text name, classname, buy cost, sell amount
weaponsArray = [
	// Pistols
	[1, "Glock 17", "glock17_EP1", 25, 10],
	[1, "Sa.61 Skorpion", "Sa61_EP1", 35, 13],
	[1, "M9 Silenced", "M9SD", 50, 25],
	[1, "UZI Silenced", "UZI_SD_EP1", 85, 35],
	[1, "Golden Revolver", "revolver_gold_EP1", 250, 125],

	// Shotguns
	[2, "M1014", "M1014", 35, 25],
	[2, "Saiga 12K", "Saiga12K", 50, 25],
	[2, "AA-12 Shotgun", "AA12_PMC", 1000, 425],

	// Rifles
	[2, "AK-74", "AK_74", 50, 25],
	[2, "AK-107 Kobra", "AK_107_kobra", 75, 30],
	[2, "M16", "M16A2", 80, 35],
	[2, "AKM", "AK_47_M", 100, 45],
	[2, "M4A1 CCO", "M4A1_Aim", 120, 55],
	[2, "AKS Silenced", "AKS_74_UN_kobra", 120, 55],
	[2, "M4A1 CCO SD", "M4A1_AIM_SD_camo", 150, 65],
	[2, "Mk 16 Holo", "SCAR_L_CQC_Holo", 190, 90],
	[2, "FN FAL", "FN_FAL", 400, 120],
	[2, "Mk 17 CCO", "SCAR_H_CQC_CCO", 450, 220],
	[2, "M14 AIM", "M14_EP1", 750, 330],

	// Sniper Rifles
	[3, "Mk12 SPR", "M4SPR", 350, 150],
	[3, "M24", "M24", 600, 300],
	[3, "Mk17 Sniper SD", "SCAR_H_LNG_Sniper_SD", 600, 300],
	[3, "Mk17 Sniper", "SCAR_H_LNG_Sniper", 800, 350],
	[3, "Mk17 Sniper TWS", "SCAR_H_STD_TWS_SD", 1200, 600],
	[3, "DMR", "DMR", 1500, 755],
	[3, "M107", "m107", 2000, 1100],
	[3, "M110 TWS", "M110_TWS_EP1", 2500, 2000],

	// Machine Guns
	[4, "RPK", "RPK_74", 150, 75],
	[4, "M249", "M249_EP1", 275, 120],
	[4, "Mk 48 Mod", "Mk_48", 350, 150],
	[4, "M60 Hog", "M60A4_EP1", 400, 230],
	[4, "Pecheneg", "Pecheneg", 450, 230],

	// Rocket Launchers
	[5, "Carl Gustav", "MAAWS", 250, 120],
	[5, "SMAW", "SMAW", 300, 175],
	[5, "RPG-7", "RPG7V", 350, 200],
	[5, "Stinger", "Stinger", 1000, 550],
	[5, "Javelin", "Javelin", 1200, 750]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [
	["5Rnd. 338 Lapua Magnum Clip", "5Rnd_86x70_L115A1", 30],
	["5Rnd. M24 Clip", "5Rnd_762x51_M24", 20],
	["6Rnd. Revolver Clip", "6Rnd_45ACP", 5],
	["8Rnd. M1014 Slug", "8Rnd_B_Beneli_74Slug", 5],
	["8Rnd. M1014 Pellets", "8Rnd_B_Beneli_Pellets", 10],
	["8Rnd. Saiga 12K Slug", "8Rnd_B_Saiga12_74Slug", 5],
	["8Rnd. Saiga 12K Pellets", "8Rnd_B_Saiga12_Pellets", 10],
	["10Rnd. SVD Dragunov", "10Rnd_762x54_SVD", 25],
	["15Rnd. M9 Silenced", "15Rnd_9x19_M9SD", 10],
	["17Rnd. Glock 17", "17Rnd_9x19_glock17", 10],
	["10Rnd. M107", "10Rnd_127x99_m107", 50],
	["20Rnd. Sa.62", "20Rnd_B_765x17_Ball", 10],
	["20Rnd. FN FAL", "20Rnd_762x51_FNFAL", 25],
	["20Rnd. DMR","20Rnd_762x51_DMR",25],
	["20Rnd. Mk17 / M110", "20Rnd_762x51_B_SCAR", 25],
	["20Rnd. Mk17 SD", "20Rnd_762x51_SB_SCAR", 25],
	["20Rnd. AA-12 Slug", "20Rnd_B_AA12_74Slug", 30],
	["20Rnd. AA-12 Pellets", "20Rnd_B_AA12_Pellets", 50],
	["30Rnd. UZI Silenced", "30Rnd_9x19_UZI_SD", 10],
	["30Rnd. AK", "30Rnd_545x39_AK", 8],
	["30Rnd. AKM / Sa58", "30Rnd_762x39_AK47", 15],
	["30Rnd. STANAG", "30Rnd_556x45_Stanag", 10],
	["30Rnd. STANAG SD", "30Rnd_556x45_StanagSD", 25],
	["75Rnd. RPK Drum", "75Rnd_545x39_RPK", 25],
	["100Rnd. STANAG Drum", "100Rnd_556x45_BetaCMag", 50],
	["100Rnd. MK48 / M60 Belt", "100Rnd_762x51_M240", 30],
	["100Rnd. Pencheng Belt", "100Rnd_762x54_PK", 50],
	["200Rnd. M249 Belt", "200Rnd_556x45_M249", 50],
	["Carl-Gustav Shot", "MAAWS_HEAT", 200],
	["Anti-personnel RPG Rocket", "OG7", 350],
	["Adv. RPG Rocket", "PG7VR", 200],
	["Basic RPG Rocket", "PG7V", 100],
	["Anti-personnel SMAW Rocket", "SMAW_HEDP", 750],
	["AT SMAW Rocket", "SMAW_HEAA", 250],
	["Stinger Missile", "Stinger", 250],
	["Javelin Missile", "Javelin", 500]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	["Hand Grenade", "BAF_L109A1_HE", 50],
	["Land Mine", "Mine", 75],
	["GPS", "ItemGPS", 100],
	["NV Goggles", "NVGoggles", 100],
	["Range Finder", "Binocular_Vector", 350]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Repair Kit", "repairkits", localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa", 1000, 500],
	["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa", 400, 200],
	["Jerry Can (Full)", "fuelFull", localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "fuelEmpty", localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon","spawnBeacon", localize "STR_WL_ShopDescriptions_spawnBeacon","client\icons\satellite.paa", 3000, 1500],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 300, 150]
];

bicycleList = [
	"MMT_Civ",
	"Old_bike_TK_CIV_EP1"
];

helicopterStore = [
	["UH-1H Huey", 1000, "UH1H_TK_GUE_EP1"],
	["MH6J Little Bird", 1200, "MH6J_EP1"],
	["KA-137 (PK)", 2000, "Ka137_MG_PMC"],
	["MH-60S Black Hawk", 2500, "MH60S"],
	["UH-60M Black Hawk", 3000, "UH60M_EP1"],
	["Merlin HC3", 3500, "BAF_Merlin_HC3_D"],
	["CH-47F Chinook", 4000, "CH_47F_EP1"],
	["Mi-8", 4500, "Mi17_Ins"],
	["MV-22 Osprey", 5000, "MV22"],
	["AH-6J Little Bird", 7000, "AH6J_EP1"],
	["Ka-60 (M32)", 8000, "Ka60_GL_PMC"],
	["UH-1Y Venom", 10000, "UH1Y"]
];

weaponBlacklist = [
	// Bombs
	"Mk82BombLauncher_6",
	// Air to Ground Missiles
	"MaverickLauncher",
	"VikhrLauncher",
	"Ch29Launcher",
	"Ch29Launcher_Su34",
	"CRV7_FAT",
	"CRV7_HEPD",
	"CRV7_PG",
	// Air to Air Missiles
	"SidewinderLaucher",
	"SidewinderLaucher_AH1Z",
	"SidewinderLaucher_AH64",
	"SidewinderLaucher_F35",
	"R73Launcher",
	"R73Launcher_2",
	// Artillery
	"D30",
	"M252",
	"MLRS",
	"GRAD",
	// Jet Chaingun
	"GAU12",
	"GAU8"
];

vehicleBlacklist = [
	// Attack Helicopters
	"AH1Z",
	"AH64D_EP1",
	"AH64D",
	"BAF_Apache_AH1_D",
	"Ka52",
	"Ka52Black",
	// Jets / Planes
	"A10_US_EP1",
	"A10",
	"AV8B2",
	"AV8B",
	"F35B",
	"Chukar_EP1",
	"Chukar",
	// Artillery
	"MAZ_543_SCUD_TK_EP1",
	"GRAD_CDF",
	"GRAD_TK_EP1",
	"GRAD_INS",
	"GRAD_RU",
	"MLRS",
	"M1129_MC_EP1",
	"D30_TK_EP1",
	"D30_CDF",
	"D30_RU",
	"D30_Ins",
	"D30_TK_INS_EP1",
	"D30_TK_GUE_EP1",
	"M119",
	"M119_US_EP1",
	"2b14_82mm_CZ_EP1",
	"2b14_82mm_INS",
	"2b14_82mm_GUE",
	"2b14_82mm_TK_GUE_EP1",
	"2b14_82mm_TK_EP1",
	"2b14_82mm",
	"2b14_82mm_CDF",
	"2b14_82mm_TK_INS_EP1",
	"M252",
	"M252_US_EP1",
	// Desert Camouflage
	"HMMWV_Avenger_DES_EP1",
	"HMMWV_MK19_DES_EP1",
	"HMMWV_TOW_DES_EP1",
	"BAF_FV510_D",
	"M1A1_US_DES_EP1",
	"M1A2_US_TUSK_MG_EP1",
	"MLRS_DES_EP1",
	// Army of the Czech Republic
	"Dingo_GL_DST_ACR",
	"Dingo_GL_Wdl_ACR",
	"Dingo_WDL_ACR",
	"Dingo_DST_ACR",
	"M1114_AGS_ACR",
	"M1114_DSK_ACR",
	"LandRover_ACR",
	"LandRover_Ambulance_ACR",
	"LandRover_Ambulance_Des_ACR",
	"Octavia_ACR",
	"UAZ_Unarmed_ACR",
	"PBX_ACR",
	"RM70_ACR",
	"T810_Des_ACR",
	"T810_ACR",
	"T810Reammo_Des_ACR",
	"T810Reammo_ACR",
	"T810Refuel_ACR",
	"T810Refuel_Des_ACR",
	"T810A_Des_MG_ACR",
	"T810A_MG_ACR",
	"T810_Open_ACR",
	"T810_Open_Des_ACR",
	"T810Repair_ACR",
	"T810Repair_Des_ACR",
	"T72_ACR",
	"BMP2_Des_ACR",
	"BMP2_ACR",
	"BRDM2_ACR",
	"BRDM2_Desert_ACR",
	"BVP1_TK_GUE_ACR",
	"BVP1_TK_ACR",
	"Pandur2_ACR",
	"Mi24_D_CZ_ACR",
	"L159_ACR",
	"L39_ACR",
	"L39_2_ACR",
	"Rbs70_ACR"
];

buildingStore = [
// -- Storage Crates ----------
	["------------------Storage---------------", 0, "---"],
	["Wooden Storage Crate", 200, "Fort_Crate_wood"],
	["B.F. Storage Crate", 500, "Misc_cargo_cont_tiny"],
// -- Base Walls ----------
	["------------------Base Walls---------------", 0, "---"],
	["H-Barrier: Large", 100, "Land_HBarrier_large"],
	["H-Barrier: Single Cube", 50, "Land_HBarrier1"],
	["Wall: Short (10 Long)", 100, "Base_WarfareBBarrier10x"],
	["Wall: Short (5 Long)", 80, "Base_WarfareBBarrier5x"],
	["Wall: Tall (10 Long)", 150, "Base_WarfareBBarrier10xTall"],
// -- Base Fortifications ----------
	["------------------Base Fortifications---------------", 0, "---"],
	["Barrack", 120, "Barrack2"],
	["Bunker (Camo Net)", 140, "Land_Fort_Watchtower"],
	["Camp", 120, "WarfareBCamp"],
	["Earthen Rampart", 80, "Land_fort_rampart"],
	["Depot", 200, "WarfareBDepot"],
// -- Base Misc ----------
	["------------------Base Misc---------------", 0, "---"],
	["Camo Net", 60, "Land_CamoNet_NATO"],
	["Dirt hump 1", 80, "Land_Dirthump03"],
	["Dirt hump 2", 40, "Land_Dirthump02"],
	["Gate", 60, "ZavoraAnim"],
	["Hedgehog Steel", 100, "Hedgehog"],
	["Med Tent", 100, "MASH"],
	["Razor Wire", 750, "Fort_RazorWire"],
	["Scaffolding: 2 story", 100, "Land_Misc_Scaffolding"],
	["Scaffolding: 4 story", 200, "Land_leseni4x"],
// -- Cargo Containers ----------
	["------------------Cargo Containers---------------", 0, "---"],
	["Cargo Container: 2x Tall", 100, "Land_Misc_Cargo2B"],
	["Cargo Container: Closed", 50, "Misc_Cargo1B_military"],
	["Cargo Container: Open", 75, "Misc_Cargo1Bo_military"],
// -- Concrete Items ----------
	["------------------Concrete Items---------------", 0, "---"],
	["Concrete Block", 60, "Land_ConcreteBlock"],
	["Concrete Pipe", 60, "Land_Misc_ConcPipeline_EP1"],
	["Concrete Ramp: Big", 60, "Land_ConcreteRamp"],
	["Concrete Ramp: Small", 60, "RampConcrete"],
	["Concrete Stack", 60, "Misc_concrete_High"],
	["Concrete Wall", 40, "Concrete_Wall_EP1"],
	["Dragons Teeth", 100, "Hhedgehog_concreteBig"],
	["Dragons Teeth: Long", 160, "Hhedgehog_concrete"],
// -- Ladders & Stairs ----------
	["------------------Ladders & Stairs---------------", 0, "---"],
	["Illumination Tower", 100, "Land_Ind_IlluminantTower"],
	["Ladder: Short", 60, "Land_ladder_half"],
	["Ladder: Tall", 80, "Land_ladder"],
	["Radio Tower", 140, "Land_radar_EP1"],
	["Staircase", 100, "Land_A_Castle_Stairs_A"],
// -- Sandbags ----------
	["------------------Sandbags---------------", 0, "---"],
	["Sandbag nest: Big", 150, "Land_fortified_nest_big"],
	["Sandbag nest: Small", 100, "Land_fortified_nest_small_EP1"],
	["Sandbag wall: Corner", 60, "Land_fort_bagfence_corner"],
	["Sandbag wall: Long", 60, "Land_fort_bagfence_long"],
	["Sandbag wall: Short", 60, "Land_BagFenceShort"],
	["Sandbag round: Large", 60, "Land_fort_bagfence_round"],
	["Sandbag round: Small", 60, "Land_BagFenceRound"],
// -- Wooden Items ----------
	["------------------Wooden Items---------------", 0, "---"],
	["Wood Board Stack", 20, "Land_Ind_BoardsPack2"],
	["Wood GuardShed", 20, "Land_GuardShed"],
	["Wood Ramp", 20, "Land_WoodenRamp"],
	["Wood Ramp Arc", 30, "Land_prebehlavka"],
// -- Static Weapons ----------
	["------------------Static Weapons---------------", 0, "---"],
	["DSHKM", 500, "DSHKM_CDF"],
	["Igla Pod", 3500, "Igla_AA_pod_East"],
	["KORD", 500, "KORD_high"],
	["L2A1 High", 550, "BAF_L2A1_Tripod_D"],
	["M240 Bunker", 350, "WarfareBMGNest_M240_US_EP1"],
	["M2 Tripod", 550, "M2HD_mini_TriPod"],
	["Metis Tripod", 2000, "Metis"],
	["MK19", 600, "MK19_TriPod"],
	["M2 High", 600, "M2StaticMG"],
	["SPG9 Tripod", 700, "SPG9_CDF"],
	["Stinger Pod", 4000, "Stinger_Pod"],
	["TOW Tripod", 4000, "TOW_TriPod"],
	["ZU23", 2000, "ZU23_CDF"]
];

// Chernarus town and town array
//Marker Name, Radius, Town Name
townList = [
	["Town_0", 600, "Chernogorsk"],
	["Town_1", 200, "Prigorodki"],
	["Town_2", 200, "Pusta"],
	["Town_3", 600, "Elektro"],
	["Town_4", 200, "Kamyshovo"],
	["Town_5", 200, "Tulga"],
	["Town_6", 250, "Solnychniy"],
	["Town_7", 200, "Nizhnoye"],
	["Town_8", 500, "Berezino City"],
	["Town_9", 500, "Berezino Dock"],
	["Town_10", 250, "Khelm"],
	["Town_11", 200, "Olsha"],
	["Town_12", 350, "Krasnostav"],
	["Town_13", 250, "East Gvozdno"],
	["Town_14", 300, "Grishino"],
	["Town_15", 200, "Petrovka"],
	["Town_16", 200, "Lopatino"],
	["Town_17", 300, "Vybor"],
	["Town_18", 250, "Pustoshka"],
	["Town_19", 200, "Myshkino"],
	["Town_20", 200, "Sosnovka"],
	["Town_21", 375, "Zelenogorsk"],
	["Town_22", 200, "Pavlovo"],
	["Town_23", 200, "Kamenka"],
	["Town_24", 200, "Komarovo"],
	["Town_25", 200, "Balota"],
	["Town_26", 200, "Bor"],
	["Town_27", 200, "Drozhino"],
	["Town_28", 200, "North Kozlovka"],
	["Town_29", 200, "Pulkovo"],
	["Town_30", 200, "Pogorevka"],
	["Town_31", 200, "Rogovo"],
	["Town_32", 200, "Kabanino"],
	["Town_33", 300, "Stary Sobor"],
	["Town_34", 200, "Novy Sobor"],
	["Town_35", 200, "Vyshnoye"],
	["Town_36", 250, "Mogilevka"],
	["Town_37", 200, "Guglovo"],
	["Town_38", 350, "Gorka"],
	["Town_39", 200, "Shakhovka"],
	["Town_40", 200, "Staroye"],
	["Town_41", 200, "Msta"],
	["Town_42", 200, "West Dolina"],
	["Town_43", 200, "Orlovets"],
	["Town_44", 200, "Polana"],
	["Town_45", 200, "Nadezhdino"],
	["Town_46", 200, "South Dubrovka"],
	["Town_47", 150, "Three Valleys"],
	["Town_48", 140, "West Gvozdno"],
	["Town_49", 180, "East Dolina"],
	["Town_50", 85, "Vysota"],
	["Town_51", 120, "South Kozlovka"],
	["Town_52", 180, "North Dubrovka"],
	["Town_53", 65, "Pass Sosnovy"]
];
