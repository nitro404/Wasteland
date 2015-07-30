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
	"76561198085238045", // Sponty
	"76561197962166875", // Dropy
	"76561198067915453", // Mobley
	"76561198041126769"  // Mawson
];
publicVariable "serverAdministrators";
