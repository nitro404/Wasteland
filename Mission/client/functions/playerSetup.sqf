
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_startingMoney"];

_startingMoney = 800;

_player = _this;

_player setskill 0;

{_player disableAI _x} foreach ["move", "anim", "target", "autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;

_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";

removeAllWeapons _player;
removeBackpack _player;

_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addMagazine "17Rnd_9x19_glock17";
_player addWeapon "glock17_EP1";
_player selectWeapon "glock17_EP1";

_player addWeapon "ItemGPS";
_player addWeapon "Binocular";

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

if(isNil {_player getVariable "cmoney"}) then {
	_player setVariable["cmoney", _startingMoney, false];
}
else {
	if(_player getVariable "cmoney" < _startingMoney) then {
		_player setVariable["cmoney", _startingMoney, false];
	};
};

_player setVariable["medkits", 0, false];
_player setVariable["fuel", 1, false];
_player setVariable["repairkits", 0, false];
_player setVariable["fuelFull", 1, false];
_player setVariable["fuelEmpty", 0, false];
_player setVariable["spawnBeacon", 0, false];
_player setVariable["ShowNameAllies", false, false];
_player setVariable["camonet", 0, false];

if(isNil {_player getVariable "earplugs"}) then {
	_player setVariable["earplugs", false, false];
};

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["Player Initialization Complete"];

playerSetupComplete = true;
