private["_nearestLandVehicle"];_nearestLandVehicle = getPos player nearestObject "LandVehicle";if(!isNull _nearestLandVehicle && player distance _nearestLandVehicle <= 10) then {	_nearestLandVehicle setVectorUp [0, 0, 1];	titleText["Vehicle flipped.", "PLAIN"];	titleFadeOut 3;}else {	titleText["No land vehicles nearby.", "PLAIN"];	titleFadeOut 3;};