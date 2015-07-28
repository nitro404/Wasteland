#define groupManagementDialog 55510
#define groupManagementGroupList 55512
 
disableSerialization;
 
private["_dialog","_playerListBox","_groupInvite","_target","_index","_playerData","_check","_unitCount"];
 
_dialog = findDisplay groupManagementDialog;
_groupListBox = _dialog displayCtrl groupManagementGroupList;
 
_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;
_check = 0;
 
//Check selected data is valid              		
{if (str(_x) == _playerData) then {_target = _x;_check = 1;};}forEach allUnits;
 
//Checks
if(_target == player) exitWith {player globalChat "you are already leader";};
if (_check == 0) exitWith {player globalChat "you must select someone to promote first";};
 
(group _target) selectLeader _target;
 
player globalChat format["you have promoted %1 to group leader",name _target];