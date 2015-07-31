//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

// Admin menu access levels (PID)

moderators = [
	"0"
];
publicVariable "moderators";

administrators = [
	"0"
];
publicVariable "administrators";

serverAdministrators = [
	"76561198078201908", // Gr8
	"76561197983361980", // nitro glycerine / David Della Rocco
	"76561198025070008", // nitro glycerine (Alt)
	"76561198085238045", // Sponty
	"76561197962166875", // Dropy
	"76561198067915453", // Mobley
	"76561198041126769", // Mawson
	"76561198087899783", // Xinova
	"76561198040557240", // Alpha Wing
	"76561197973639507", // Corpsegrinder
	"76561198026982182", // with_milk
	"76561197960440011", // Spangler
	"76561198041279329", // Drew
	"76561198090673661", // Drew (Alt)
	"76561197992556451", // Tesla
	"76561198011088596", // Skipwich
	"76561197961014283", // Yams
	"76561197980727745"  // Northern Petrol
];
publicVariable "serverAdministrators";
