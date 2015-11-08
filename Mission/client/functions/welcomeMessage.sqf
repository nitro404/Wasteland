#define welcomeText 3200

private["_teamRules", "_teamIcon", "_teamColour"];

10 cutrsc["WelcomeMessage", "PLAIN"];

disableSerialization;

_display = uiNamespace getVariable "WelcomeMessage";
_control = _display displayCtrl welcomeText;

switch(str(side player)) do {
	case "WEST": {
		_teamRules = "STR_WL_YouAreInTeam";
		_teamIcon = "\ca\ui\data\igui_side_blufor_ca.paa";
		_teamColour = "#3333ff";
	};
	case "EAST": {
		_teamRules = "STR_WL_YouAreInTeam";
		_teamIcon = "\ca\ui\data\igui_side_opfor_ca.paa";
		_teamColour = "#cc0000";
	};
	case "GUER": {
		_teamRules = "STR_WL_YouAreInFFA";
		_teamIcon = "\ca\ui\data\igui_side_indep_ca.paa";
		_teamColour = "#00cc00";
	};
};

_control ctrlSetStructuredText (parseText format[
	"<t shadow=""1""><t size=""2"">%1</t> (%2)<br/>%4<br/>%3</t>",
	localize "STR_WL_WelcomeToWasteland",
	versionName,
	format[
		localize _teamRules,
		_teamIcon,
		_teamColour,
		localize format ["STR_WL_Gen_Team%1", str(side player)],
		localize format ["STR_WL_Gen_Team%1_2", str(side player)]
	],
	localize "STR_WL_MapMoreInfo"
]);

sleep 10;

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;