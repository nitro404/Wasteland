//@file Author: [404] Costlyy
//@file Version: 1.0
//@file Date: 21/11/2012
//@file Description: The action after the teamkillee as selected an option for the teamkiller.
//@file Args: [boolean(punish = true)]
//@file Notes: Everyone is free to use / redistribute / modify this file.

closeDialog 0;

if(!isPlayer pDialogTeamkiller) exitWith { };

if(_this) then {
	_uid = getPlayerUID pDialogTeamkiller;
	_added = false;
	for "_i" from 0 to (count teamKillList - 1) do {
		if((teamKillList select _i select 0) == _uid) then {
			teamKillList set [_i, [_uid, (teamKillList select _i select 1) + 1]];
			_added = true;
		};
	};

	if(!_added) then {
		[teamKillList, [_uid, 1]] call BIS_fnc_arrayPush;
		_added = true;
	};
	publicVariable "teamKillList";
}
