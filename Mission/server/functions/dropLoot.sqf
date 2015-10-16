//	@file Version: 1.0
//	@file Name: dropLoot.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 13
//	@file Args: Unit

_droppedCash = "Evmoney" createVehicle (_this select 0 select 0);
_droppedCash setVariable["money", 100, true];
_droppedCash setVariable["owner", "world", true];
_droppedCash setVariable["creationTime", time, true];
