private["_playerNamesVisible"];

_playerNamesVisible = player getVariable["ShowNameAllies", false];
player setVariable["ShowNameAllies", !_playerNamesVisible];
