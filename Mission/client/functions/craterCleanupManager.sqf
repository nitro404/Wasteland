if(isServer) exitWith { };

private["_numberOfCratersDeleted"];

while { true } do {

	{
		[_x, 600] call cleanupObject;
	} forEach (allMissionObjects "CraterLong");

	sleep 60;
};
