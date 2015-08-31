private["_earplugsEnabled"];

_earplugsEnabled = player getVariable["earplugs", 0];
player setVariable["earplugs", !_earplugsEnabled, false];

if(!_earplugsEnabled) then {
	1 fadeSound 0.25;
	hintSilent "Earplugs Inserted";
}
else {
	1 fadeSound 1;
	hintSilent "Earplugs Removed";
};
