//	@file Version: 1.0
//	@file Name: randomObject.sqf
//	@file Author: nitro glycerine
//	@file Created: 26/08/2015 4:54 PM
//	@file Args: [category] call randomObject;

private["_category", "_randomNumber", "_categoryWeight", "_currentCategoryIndex", "_currentCategory", "_selectedCategoryIndex", "_selectedCollection", "_selectedList"];

if(count _this < 1) exitWith {
	diag_log format["randomObject Error: Requires minimum of 1 argument, received %1.", count _this]
};

_category = _this select 0;

if(typeName _category != "ARRAY") exitWith {
	diag_log format["randomObject Arg0 Error: Invalid category argument - expected array, received %1.", typeName _category]
};

_randomNumber = random 100;
_categoryWeight = 100.0;
_currentCategoryIndex = (count _category) - 1;
_currentCategory = nil;
_selectedCategoryIndex = _currentCategoryIndex;

while { _currentCategoryIndex >= 0 } do {
	_currentCategory = _category select _currentCategoryIndex;

	if(_randomNumber < _categoryWeight) then {
		_selectedCategoryIndex = _currentCategoryIndex;
	};

	_categoryWeight = _categoryWeight - (_currentCategory select 1);
	_currentCategoryIndex = _currentCategoryIndex - 1;
};

_selectedCollection = (_category select _selectedCategoryIndex) select 2;
_selectedList = _selectedCollection select floor(random count _selectedCollection);
_selectedList select floor(random count _selectedList);
