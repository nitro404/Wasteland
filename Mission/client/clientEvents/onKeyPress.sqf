//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_handled"];

_key = _this select 1;
_shift = _this select 2;
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
        [] call togglePlayerNames;
    };

    // Tilde
    case 41: {
        [] spawn loadPlayerMenu;
    };

    // E
	case 18: {
        [] call removeParachute;
    };

    // F11
    case 87: {
        [] call toggleVehicleLock;
    };
};

_handled
