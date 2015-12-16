if(!(cursorTarget isKindOf "Bicycle")) exitWith { };

if(count crew cursorTarget > 0) exitWith { };

deleteVehicle cursorTarget;
