//	@file Version: 1.0
//	@file Name: loadGroupManagement.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "dialog\groupManagementDefines.sqf";

disableSerialization;

private["_start", "_dialog", "_myGroup", "_playerListBox", "_groupListBox", "_uid", "_index", "_groupCreate", "_groupInvite", "_groupKick", "_groupDisband", "_groupLeaveButton", "_inGroup", "_isLeader", "_name"];

closeDialog 0;
_start = createDialog "GroupManagement";
_dialog = findDisplay groupManagementDialog;

if(!isNil "_display") then {
    _display displayAddEventHandler ["KeyDown", "_return = false; if(groupManagmentActive && (_this select 1) == 1) then {_return = true;}; _return"];
};

groupManagmentActive = true;

_playerListBox = _dialog displayCtrl groupManagementPlayerList;
_groupListBox = _dialog displayCtrl groupManagementGroupList;
_groupInvite = _dialog displayCtrl groupManagementInviteButton;
_groupKick = _dialog displayCtrl groupManagementKickButton;
_groupDisband = _dialog displayCtrl groupManagementDisbandButton;
_groupLeaveButton = _dialog displayCtrl groupManagementLeaveButton;
_groupAcceptInvite = _dialog displayCtrl groupManagementAcceptButton;
_groupDeclineInvite = _dialog displayCtrl groupManagementDeclineButton;
_groupInviteText = _dialog displayCtrl groupManagementInviteText;
_groupPromote = _dialog displayCtrl groupManagementPromoteButton;

_groupInvite ctrlShow false;
_groupKick ctrlShow false;
_groupDisband ctrlShow false;
_groupLeaveButton ctrlShow false;
_groupDeclineInvite ctrlShow false;
_groupAcceptInvite ctrlShow false;
_groupPromote ctrlShow false;
_hasInvite = false;

while { groupManagmentActive } do {
    // check if player has invite
    {
        if(_x select 1 == getPlayerUID player) then {
            _hasInvite = true
        };
    } forEach currentInvites;

    // member controls
    if(count units group player > 1) then {
        if(player == leader group player) then {
			_groupDisband ctrlShow true;
            _groupKick ctrlShow true;
			_groupLeaveButton ctrlShow true;
			_groupPromote ctrlShow true;
        }
        else {
			_groupLeaveButton ctrlShow true;
			_groupPromote ctrlShow false;
        };
    }
    else {
    	_groupKick ctrlShow false;
		_groupDisband ctrlShow false;
		_groupLeaveButton ctrlShow false;
		_groupPromote ctrlShow false;
    };

	// sort invite controls
    if(_hasInvite) then {
        _groupInviteText ctrlShow true;
        _groupAcceptInvite ctrlShow true;
        _groupDeclineInvite ctrlShow true;

		// get invite text and set it
        {
            _invite = _x;

            if(_invite select 1 == getPlayerUID player) then {
                {
                    if(_invite select 0 == getPlayerUID _x) then {
                        _name = name _x;
                    };
                } forEach playableUnits;
            };
        } forEach currentInvites;

        _groupInviteText ctrlSetStructuredText parseText(format["Group Invite From<br/>%1", _name]);
    }
    else {
    	_groupAcceptInvite ctrlShow false;
        _groupDeclineInvite ctrlShow false;
        _groupInviteText ctrlShow false;
    };

	// update player list
	{
		if(side group _x == side group player) then {
	        if(getPlayerUID _x != getPlayerUID player) then {
				_index = _playerListBox lbAdd (name _x);
				_playerListBox lbSetData[_index, str _x];
	        };
	    };
	} forEach playableUnits - units group player;

	// update group player list
    {
		_index = _groupListBox lbAdd (name _x);
		_groupListBox lbSetData [_index, str _x];
    } forEach units group player;

	sleep 0.5;

    _hasInvite = false;

    lbClear _playerListBox;
    lbClear _groupListBox;
}
