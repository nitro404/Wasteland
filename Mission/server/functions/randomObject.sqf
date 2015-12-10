//	@file Version: 1.0
//	@file Name: randomObject.sqf
//	@file Author: nitro glycerine
//	@file Created: 26/08/2015 4:54 PM
//	@file Args: category call randomObject;

private["_randomNumber", "_categoryWeight", "_currentCategoryIndex", "_currentCategory", "_selectedCategoryIndex", "_selectedCollection"];

if(typeName _this != "ARRAY") exitWith {
	diag_log format["randomObject Arg Error: Invalid category argument - expected array, received %1.", typeName _this]
};

_randomNumber = random 100;
_categoryWeight = 100.0;
_currentCategoryIndex = (count _this) - 1;
_currentCategory = nil;
_selectedCategoryIndex = _currentCategoryIndex;

while { _currentCategoryIndex >= 0 } do {
	_currentCategory = _this select _currentCategoryIndex;

	if(_randomNumber < _categoryWeight) then {
		_selectedCategoryIndex = _currentCategoryIndex;
	};

	_categoryWeight = _categoryWeight - (_currentCategory select 1);
	_currentCategoryIndex = _currentCategoryIndex - 1;
};

_selectedCollection = (_this select _selectedCategoryIndex) select 2;

(_selectedCollection call BIS_fnc_selectRandom) call BIS_fnc_selectRandom
