//	@file Version: 1.0
//	@file Name: createGeneralStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_generalStores = [["generalStore1", 200], ["generalStore2", 200], ["generalStore3", 200], ["generalStore4", 200], ["generalStore5", 200], ["generalStore6", 200]];

[_generalStores, "Grid", "ColorBlue", 0.5, "ELLIPSE", "generalStore", ["General Store", "ColorOrange"]] execVM "client\functions\createMarkers.sqf";
