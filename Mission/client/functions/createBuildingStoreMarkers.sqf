//	@file Version: 1.0
//	@file Name: createBuildingStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_buildingStores = [
	["buildingStore1", 200, "Building Store"]
//	["buildingStore2", 200, "Building Store"],
//	["buildingStore3", 200, "Building Store"],
//	["buildingStore4", 200, "Building Store"],
//	["buildingStore5", 200, "Building Store"]
];

[_buildingStores, "Grid", "ColorBlue", 0.5, "ELLIPSE", "buildingStore", ["Building Store", "ColorGreen"]] execVM "client\functions\createMarkers.sqf";
