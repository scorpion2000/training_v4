params ["_controllers"];

_factions = ["nato", "csat", "usa", "russia"];
_vehicleGroup = "";

{
	_faction = _x;
	_action = [_faction, _faction, "", {}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;

	
	_vehicles = [] call compile preprocessFileLineNumbers (format ["scripts\boats\%1.sqf", _faction]);
	{
		_className = _x;
		_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		_action = [_className, _name, "", {
			params ["_target", "_player", "_params"];
			_trigger = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"trigger"] joinString "_", objNull];
			_positions = _trigger getVariable ["spawnPositions", []];
			_sortedPositions = [_positions, [], {(_x select 0) distance _player}, "ASCEND"] call BIS_fnc_sortBy;
			_spawnPos = [];
			_spawnDir = 0;
			{
				if (count _spawnPos != 0) then {break};
				_spawnPos = (_x select 0) findEmptyPosition [0,1,(_params select 0)];
				_spawnDir = (_x select 1);
			} forEach _sortedPositions;

			if (count _spawnPos != 0) then {
				_vehicle = createVehicle [(_params select 0), _spawnPos, [], 0, "CAN_COLLIDE"];
				_vehicle setDir _spawnDir;
			};

			_vehicle setVariable ["thisOwner", (owner player), true];
			_allVehicles = player getVariable ["enteredVehicles", []];
			_allVehicles pushBack _vehicle;
			player setVariable ["enteredVehicles", _allVehicles];
		}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
		{
			[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
		} forEach _controllers;
	} forEach _vehicles;
} forEach wsot_allFactionsArray;