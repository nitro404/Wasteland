//	@file Version: 1.0
//	@file Name: createClientMarker.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19
//	@file Args: [name, postion, text] call createClientMarker;

if(!isServer) exitwith { };

clientMissionMarkers set [count clientMissionMarkers, [_this select 0, _this select 1, _this select 2]];
publicVariable "clientMissionMarkers";
