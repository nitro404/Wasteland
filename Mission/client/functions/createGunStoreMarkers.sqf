//	@file Version: 1.0
//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_gunStores = [["gs1", 200], ["gs2", 200], ["gs3", 200], ["gs4", 200], ["gs5", 200], ["gs6", 200], ["gs7", 200]];

[_gunStores, "Grid", "ColorBlue", 0.5, "ELLIPSE", "gs", ["Gun Store", "ColorRed"]] execVM "client\functions\createMarkers.sqf";
