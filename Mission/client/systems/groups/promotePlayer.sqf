#define groupManagementDialog 55510
#define groupManagementGroupList 55512

disableSerialization;

private["_dialog", "_playerListBox", "_groupInvite", "_target", "_index", "_playerData", "_check", "_unitCount"];

_dialog = findDisplay groupManagementDialog;
_groupListBox = _dialog displayCtrl groupManagementGroupList;

_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;
_check = 0;
_target = objNull;

{
	if(str(_x) == _playerData) then {
		_target = _x;
		_check = 1;
	};
} forEach allUnits;

if(_check == 0 || isNull _target) exitWith {
	player globalChat "You must select someone to promote first! null or check";
};

if(_target == player) exitWith {
	player globalChat "You are already the group leader!";
};

if(count (toArray name _target) <= 0) exitWith {
	player globalChat "You must select someone to promote first! 0 length";
};

(group _target) selectLeader _target;

player globalChat format["You have promoted %1 to group leader.", name _target];
