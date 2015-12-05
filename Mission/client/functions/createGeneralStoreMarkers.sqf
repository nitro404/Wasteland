//	@file Version: 1.0
//	@file Name: createGeneralStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_generalStores = [
	["generalStore1", 200, "General Store"],
	["generalStore2", 200, "General Store"],
	["generalStore3", 200, "General Store"],
	["generalStore4", 200, "General Store"],
	["generalStore5", 200, "General Store"],
	["generalStore6", 200, "General Store"]
];

[_generalStores, "Grid", "ColorBlue", 0.5, "ELLIPSE", "generalStore", ["General Store", "ColorOrange"]] call createMarkers;
