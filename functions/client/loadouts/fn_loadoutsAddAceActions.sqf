params ["_controllers"];

_types = ["Lövész", "Géppuskás", "Céllövész", "Vezető", "Rakétás", "Orvos", "EOD", "Pilóta", "Járművesek", "Tüzér", "UAV"];

_action = ["loadouts", "Gyors Felszerelések", "", {systemChat "asd";}, {true}] call ace_interact_menu_fnc_createAction;
{
	[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _controllers;

{
	_type = _x;
	_action = [_type, _type, "", {systemChat "asd";}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions", "loadouts"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;
} forEach _types;

_loadouts = missionNamespace getVariable ["wsot_loadouts", []];

{
	_type = (_x select 0);
	_name = (_x select 1);
	_loadout = (_x select 2);
	_action = [_name, _name, "", {
		params ["_target", "_player", "_params"];
		_player setUnitLoadout (_params select 0);
	}, {true}, {}, [_loadout]] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions", "loadouts", _type], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;
} forEach _loadouts;