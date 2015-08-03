
//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:


private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

switch _key do {
    // U
    case 22: {
        [0] execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
    // Y
    case 21: {
        [1] execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
    // Left Windows Key
    case 219: {
        player setVariable ["ShowNameAllies", true];
        [] spawn {
            sleep 5;
            player setVariable ["ShowNameAllies", false];
        };
    };
    // Tilde
    case 41: {
        [] call loadPlayerMenu;
    };
    // E
	case 18: {
        if(!alive player) exitwith{};  // Check the player is not dead.

        if(vehicle player != player) then {
            if ( vehicle player isKindOf 'ParachuteBase' ) then {
                execVM 'client\functions\removeParachute.sqf';
            };
        }
        else {
            private ["_storeInteractionBuffer", "_storeInteractionZone", "_currPos", "_store", "_relativeDir", "_absoluteDir"];

            _storeInteractionBuffer = 10; // The acceptable +/- look direction for interacting with stores. Higher = wider look angle.
            _storeInteractionZone = 3; // The furthest away the player can be from a store to interact with it. Higher = further.
            _currPos = getPosATL player;

            _gunStore = nearestObjects [_currPos, ["CIV_Contractor1_BAF"], _storeInteractionZone];
            _genStore = nearestObjects [_currPos, ["TK_CIV_Takistani04_EP1"], _storeInteractionZone];

            if(!isNull (_gunStore select 0)) then {
            	_relativeDir = [player, _gunStore select 0] call BIS_fnc_relativeDirTo;
           		_absoluteDir = abs _relativeDir;

                if(_absoluteDir < _storeInteractionBuffer OR _absoluteDir > (360 - _storeInteractionBuffer)) then {
    				//Great success! Player is actually looking at the store keeper and is close by.
                    if (dialog) exitwith { closeDialog 0; }; // Check a current dialog is not already active.
                	[] spawn loadGunStore;
            	};
            };

            if(!isNull (_genStore select 0)) then {
            	_relativeDir = [player, _genStore select 0] call BIS_fnc_relativeDirTo;
           		_absoluteDir = abs _relativeDir;

                if(_absoluteDir < _storeInteractionBuffer OR _absoluteDir > (360 - _storeInteractionBuffer)) then {
    				//Great success! Player is actually looking at the store keeper and is close by.
                    if (dialog) exitwith { closeDialog 0; }; // Check a current dialog is not already active.
                	[] spawn loadGeneralStore;
            	};
            };
        };
    };
};

_handled;
