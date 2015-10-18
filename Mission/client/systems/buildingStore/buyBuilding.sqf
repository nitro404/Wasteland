#include "dialog\buildingStoreDefines.sqf";

disableSerialization;

_playerMoney = player getVariable "money";
_size = 0;
_price = 0;
_objectsInArea = [];

_dialog = findDisplay buildingStore_DIALOG;
_priceText = _Dialog displayCtrl buildingStore_price;
_itemList = _dialog displayCtrl buildingStore_item_list;

/*
 * Makes sure the player has enough money to purchase the object
 * and if they do, subtracts the amount from the player's balance.
 * Usage: [ [ price, obj_name ] ] call _complete_purchase;
 * Returns: true on success, false if the player doesn't have enough money.
 */
_complete_purchase = {
	_success = false;

	_price = (_this select 0) select 1;
	_name  = (_this select 0) select 2;

	if(_price <= (player getVariable "money")) then {
		player setVariable["money", _playerMoney - _price, true];
		_priceText CtrlsetText format["Money: $%1", player getVariable "money"];
		_success = true;
	};

	_success
};

/*
 * Spawns the given object in at the buildingStoreSpawn.
 * Usage: [ "Misc_Cargo1B_military" ] call _spawn_object;
 * Returns: Reference to the object
 */
_spawn_object = {
	_name = _this select 0;

	_spawn = createVehicle[_name,getPos buildingStoreSpawn, [], 0, "CAN_COLLIDE"];
	_spawn setDir (getDir buildingStoreSpawn) + 180;
	clearMagazineCargoGlobal _spawn;
	clearWeaponCargoGlobal _spawn;
	_spawn setVariable["original",1,true];
	_spawn setVariable["R3F_LOG_disabled", false, true];

	_spawn
};

/*
 * Returns the storage space for the given object.
 * Usage: [ _obj ] call _find_capacity
 * Returns: Number. Storage capacity.
 */
_find_capacity = {
	_transporteur = _this select 0;

	// Recherche de la capacité maximale du transporteur
	// Search for the maximum capacity of the carrier
	_chargement_maxi = 0;
	for[{_i = 0}, {_i < count R3F_LOG_CFG_transporteurs}, {_i = _i + 1}] do {
		if (_transporteur isKindOf (R3F_LOG_CFG_transporteurs select _i select 0)) exitWith {
			_chargement_maxi = (R3F_LOG_CFG_transporteurs select _i select 1);
		};
	};

	_chargement_maxi
};

/*
 * Returns the amount of space already used in the given object.
 * Usage: [ _obj ] call _find_used_space
 * Returns: Number
 */
_find_used_space = {
	_transporteur = _this select 0;
	_objets_charges = _transporteur getVariable "R3F_LOG_objets_charges";

	// Calcul du chargement actuel
	_chargement_actuel = 0;
	{
		for[{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do {
			if (_x isKindOf (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith {
				_chargement_actuel = _chargement_actuel + (R3F_LOG_CFG_objets_transportables select _i select 1);
			};
		};
	} forEach _objets_charges;

	_chargement_actuel
};

/*
 * Returns the amount of space available in the given object.
 * Usage: [ _obj ] call _available_space
 * Returns: Number
 */
_available_space = {
	_obj = _this select 0;

	_capacity = [_obj] call _find_capacity;
	_used     = [_obj] call _find_used_space;

	_capacity - _used
};

/*
 * Returns the size of the object, i.e. how much room it would take
 * if it was loaded into a storage container.
 * Usage: [ "Misc_Cargo1B_military" ] call _object_size;
 * Returns: Number
 */
_object_size = {
	_objet = _this select 0;
	_cout_capacite_objet = 5;
	for[{_i = 0}, {_i < count R3F_LOG_CFG_objets_transportables}, {_i = _i + 1}] do {
		if(_objet == (R3F_LOG_CFG_objets_transportables select _i select 0)) exitWith {
			_cout_capacite_objet = (R3F_LOG_CFG_objets_transportables select _i select 1);
		};
	};

	_cout_capacite_objet
};

/*
 * Given a reference to a container and the name of an object
 * it will determin in the item will fit in the container.
 * Usage: [ _obj_container, "Misc_Cargo1B_military" ] call _will_fit;
 * Returns: Boolean
 */
_will_fit = {
	_container = _this select 0;
	_to_buy = _this select 1;

	_space = [_container] call _available_space;
	_size = [_to_buy] call _object_size;

	_space >= _size
};

_selectedItem = lbCurSel _itemList;
_itemText = _itemList lbText _selectedItem;
{if(_itemText == _x select 0) then{
	sleep 1;
	_objectsInArea = [(getPos buildingStoreSpawn) select 0, (getPos buildingStoreSpawn) select 1] nearObjects 2;

	// Ignore bugs and feathers
	_ignore = [];
	{
		if ( _x isKindOf 'HoneyBee' || _x isKindOf 'DragonFly' || _x isKindOf 'HouseFly' || _x isKindOf 'FxWindPollen1' ) then {
			_ignore = _ignore + [ _x ];
		};

	} forEach _objectsInArea;

	_objectsInArea = _objectsInArea - _ignore;
	_objectsInArea = _objectsInArea + ( [(getPos buildingStoreSpawn) select 0, (getPos buildingStoreSpawn) select 1] nearObjects ['Car', 10] );

	if(count _objectsInArea <= 1) then {
		if ( [ _x ] call _complete_purchase ) then {
			_purchase = [ _x select 2 ] call _spawn_object;
			hintsilent "Building bought - Check the spawn area.";
		}
		else {
			hintsilent "You do not have enough money";
		}
	}
	else {
		_obj = nil;
		{
			if(!isNil { _x getVariable "R3F_LOG_objets_charges" }) exitwith {
				_obj = _x;
			}
		} forEach _objectsInArea;

		if(!isNil { _obj getVariable "R3F_LOG_objets_charges" }) then {
			if([_obj, _x select 2] call _will_fit) then {
				if([_x] call _complete_purchase) then {
					_purchase = [ _x select 2 ] call _spawn_object;

					_objets_charges = _obj getVariable "R3F_LOG_objets_charges";
					_objets_charges = _objets_charges + [_purchase];
					_obj setVariable["R3F_LOG_objets_charges", _objets_charges, true];

					// Choisir une position dégagée (sphère de 50m de rayon) dans le ciel dans un cube de 9km^3
					private ["_nb_tirage_pos", "_position_attache"];
					_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
					_nb_tirage_pos = 1;

					while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do {
						_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
						_nb_tirage_pos = _nb_tirage_pos + 1;
					};

					_purchase attachTo [R3F_LOG_PUBVAR_point_attache, _position_attache];

					_obj_name = getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");
					hintsilent format["Building bought - Check in %1", _obj_name];
				}
				else {
					hintsilent "You do not have enough money";
				};
			}
			else {
				hintsilent "There is another object blocking the spawn point and it does not have room!";
			};
		}
		else {
			hintsilent "There is another Building or player blocking the spawn point!";
		};
	};
}} forEach buildingStore;

ctrlEnable[1000, true];
