//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

//Admin menu access levels
moderators = [
	"0", // DUDE #1 
	"0", // DUDE #2
"0" // Add UIDs Above, dont Forget Comma
]; 
publicVariable "moderators"; 
           
administrators = [
	"0", // DUDE #1 
	"0", // DUDE #2
"0" // Add UIDs Above, dont Forget Comma
];
publicVariable "administrators";

serverAdministrators = [
	"76561198078201908", // Gr8 
	"0", // nitro ?
"0" // Add UIDs Above, dont Forget Comma
]; 
publicVariable "serverAdministrators";