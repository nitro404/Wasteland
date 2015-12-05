//	@file Version: 1.0
//	@file Name: createChopperStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_helicopterStores = [
	["helicopterStore1", 200, "Helicopter Store"],
	["helicopterStore2", 200, "Helicopter Store"],
	["helicopterStore3", 200, "Helicopter Store"]
];

[_helicopterStores, "Grid", "ColorBlue", 0.5, "ELLIPSE", "helicopter", ["Helicopter Store", "ColorYellow"]] call createMarkers;
