//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!isServer) exitWith { };

moderators = [

];
publicVariable "moderators";

administrators = [

];
publicVariable "administrators";

serverAdministrators = [
	"76561197983361980", // nitro glycerine
	"76561198025070008", // nitro glycerine (Alt)
	"76561198085238045", // Sponty
	"76561198067915453", // Mobley
	"76561198041126769", // Mawson
	"76561198087899783", // Xinova
	"76561198040557240", // Alpha Wing
	"76561197973639507", // Corpsegrinder
	"76561198026982182", // with_milk
	"76561197960440011", // Spangler
	"76561198041279329", // Drew
	"76561198090673661", // Drew (Alt)
	"76561198011088596", // Skipwich
	"76561197961014283", // Yams
	"76561197980727745", // Northern Petrol
	"76561197969422593", // BRPC
	"76561198028354532", // jaeger
	"76561198106264272", // Nash
	"76561197993249654"  // LeSk8trE
];
publicVariable "serverAdministrators";
