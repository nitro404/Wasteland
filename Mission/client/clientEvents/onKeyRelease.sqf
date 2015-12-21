//	@file Version: 1.0
//	@file Name: onKeyRelease.sqf
//	@file Author: nitro glycerine
//	@file Created: 21/12/2015 9:12 AM
//	@file Args:

private["_key", "_shift", "_handled"];

_key = _this select 1;
_shift = _this select 2;
_handled = false;

switch _key do {
    // Left Windows Key
    case 219: {
        togglingPlayerNames = false;
    };
};

_handled
