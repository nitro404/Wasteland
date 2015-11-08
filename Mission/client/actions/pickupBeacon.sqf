
//	@file Version: 1.0
//	@file Name: pickupBecon.sqf
//	@file Author: [404] Costlyy
//	@file Created: 7/12/2012 23:30
//	@file Args:[,,,int (1 = destroy | 0 = steal)]

if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_totalDuration", "_lockDuration", "_iteration", "_iterationPercentage", "_currSpawnBeaconFaction", "_destroyOrSteal", "_currBeaconOwnerUID", "_currBeaconTemp"];

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

_currSpawnBeaconFaction = ((nearestobjects [getpos player, ["Satelit"],  5] select 0) getVariable "faction");

if(isNil{_currSpawnBeaconFaction}) exitWith {
	diag_log "There was a problem finding a spawn beacon.";
};

_currSpawnBeacon = (nearestobjects [getpos player, ["Satelit"],  5] select 0);
_destroyOrSteal = _this select 3;
_iteration = 0;

if(_destroyOrSteal == 0 AND (player getVariable "spawnBeacon") > 0) exitWith {
	player globalChat localize "STR_WL_Errors_BeaconTooMany";
};

player switchMove "AinvPknlMstpSlayWrflDnon_medic";

switch (_destroyOrSteal) do {
    case 0: {

    	_totalDuration = 60;
		_lockDuration = _totalDuration;
     	mutexScriptInProgress = true;

		for "_iteration" from 1 to _lockDuration do {

           	if(vehicle player != player) exitWith {
				player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        		player action ["eject", vehicle player];
				sleep 1;
				mutexScriptInProgress = false;
			};

            if (doCancelAction) exitWith {
    			2 cutText ["", "PLAIN DOWN", 1];
        		doCancelAction = false;
    			mutexScriptInProgress = false;
			};

            if (!(alive player)) exitWith {
				2 cutText ["Steal spawn beacon interrupted...", "PLAIN DOWN", 1];
                mutexScriptInProgress = false;
			};

			if(player distance _currSpawnBeacon > 5) exitWith {
				2 cutText ["Steal spawn beacon interrupted...", "PLAIN DOWN", 1];
		        mutexScriptInProgress = false;
			};

		    if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
		        player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		    };

            _lockDuration = _lockDuration - 1;
			_iterationPercentage = floor (_iteration / _totalDuration * 100);

			2 cutText [format["Steal Spawn Beacon (%1%2)", _iterationPercentage, "%"], "PLAIN DOWN", 1];
			sleep 1;

			if (_iteration >= _totalDuration) exitWith {
				sleep 1;
		        2 cutText ["", "PLAIN DOWN", 1];

                _currBeaconOwnerUID = _currSpawnBeacon getVariable "owner";
                _currBeaconTemp = (nearestObjects [getpos player, ["Satelit"],  5]) select 0;

		        if(isNil { _currBeaconTemp }) then {
                	hint "Your attempt to steal the enemy spawn beacon was unsuccessful.";
                    mutexScriptInProgress = false;
                } else {
	               	deleteVehicle (nearestobjects [getpos player, ["Satelit"],  5] select 0);
	                player setVariable["spawnBeacon",1,true];
	                hint "You have successfully stolen the enemy spawn beacon.";
			        mutexScriptInProgress = false;

			[_currBeaconOwnerUID, _currBeaconTemp getVariable "faction"] call cleanBeaconArrays;
                };
			};
		};
    };
    case 1: {

   	 	_totalDuration = 30;
		_lockDuration = _totalDuration;
        mutexScriptInProgress = true;

		for "_iteration" from 1 to _lockDuration do {

            if(vehicle player != player) exitWith {
				player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        		player action ["eject", vehicle player];
				sleep 1;
				mutexScriptInProgress = false;
			};

            if (doCancelAction) exitWith {
    			2 cutText ["", "PLAIN DOWN", 1];
        		doCancelAction = false;
    			mutexScriptInProgress = false;
			};

            if (!(alive player)) exitWith {
				2 cutText ["Destroy spawn beacon interrupted...", "PLAIN DOWN", 1];
                mutexScriptInProgress = false;
			};

			if(player distance _currSpawnBeacon > 5) exitWith {
				2 cutText ["Destroy spawn beacon interrupted...", "PLAIN DOWN", 1];
		        mutexScriptInProgress = false;
			};

		    if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
		        player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		    };

            _lockDuration = _lockDuration - 1;
			_iterationPercentage = floor (_iteration / _totalDuration * 100);

            2 cutText [format["Destroy spawn beacon %1%2 complete", _iterationPercentage, "%"], "PLAIN DOWN", 1];
			sleep 1;

			if (_iteration >= _totalDuration) exitWith {
				sleep 1;
		        2 cutText ["", "PLAIN DOWN", 1];

                _currBeaconOwnerUID = _currSpawnBeacon getVariable "owner";
                _currBeaconTemp = (nearestObjects [getpos player, ["Satelit"],  5]) select 0;

		        if(isNil { _currBeaconTemp }) then {
                	hint "Your attempt to destroy the spawn beacon was unsuccessful.";
                    mutexScriptInProgress = false;
                } else {
	               	deleteVehicle (nearestobjects [getpos player, ["Satelit"],  5] select 0);
	                hint "You have successfully destroyed the spawn beacon.";
			        mutexScriptInProgress = false;

			[_currBeaconOwnerUID, _currBeaconTemp getVariable "faction"] call cleanBeaconArrays;
                };
			};
		};
    };
};

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
