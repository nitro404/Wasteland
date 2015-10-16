//  @file Version: 1.0
//  @file Name: placeCamoNet.sqf
//  @file Author: [404] Costlyy, [404] Pulse
//  @file Created: 29th May 13

player setVariable["camonet", (player getVariable "camonet") - 1, true];

_camoNet = "Land_CamoNet_NATO" createVehicle (position player);
_camoNet setPos (getPosATL player);
_camoNet setDir (getDir player);
_camoNet setVariable["owner", getPlayerUID player, true];
_camoNet setVariable["creationTime", time, true];

hint "Camo Net Deployed!";
