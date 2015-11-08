if(!alive player) exitWith { };

if(vehicle player == player) exitWith { };

if(vehicle player isKindOf "ParachuteBase") then {
	deleteVehicle vehicle player;

	player switchmove "aidlpercmstpsraswrfldnon_idlesteady01";
};
