//	@file Version: 1.0
//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_gunStores = [
	["gs1", 200, "Gun Store"],
	["gs2", 200, "Gun Store"],
	["gs3", 200, "Gun Store"],
	["gs4", 200, "Gun Store"],
	["gs5", 200, "Gun Store"],
	["gs6", 200, "Gun Store"],
	["gs7", 200, "Gun Store"]
];

[_gunStores, "Grid", "ColorBlue", 0.5, "ELLIPSE", "gs", ["Gun Store", "ColorRed"]] call createMarkers;
