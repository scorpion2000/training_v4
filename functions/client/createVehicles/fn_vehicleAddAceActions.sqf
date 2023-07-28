params ["_controllers"];

_factions = ["nato", "csat"];
_vehicleGroup = "";

{
	_faction = _x;
	_vehicleGroups = [] call compile preprocessFileLineNumbers (format ["scripts\vehicles\%1.sqf", _faction]);
	_action = [_faction, _faction, "", {}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;

	{
		_vehicles = _x;
		{
			if (_foreachIndex == 0) then {
				_name = (_x select 1);
				_vehicleGroup = [_faction, (_x select 0)] joinString "_";
				_action = [_vehicleGroup, _name, "", {}, {true}] call ace_interact_menu_fnc_createAction;
				{
					[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
				} forEach _controllers;
			} else {
				_name = (_x select 0);
				_className = (_x select 1);
				_action = [_className, _name, "", {
					params ["_target", "_player", "_params"];
					_trigger = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"trigger"] joinString "_", objNull];
					_positions = _trigger getVariable ["spawnPositions", []];
					_spawnPos = [];
					{
						if (count _spawnPos != 0) then {break};
						_spawnPos = _x findEmptyPosition [0,1,(_params select 0)];
					} forEach _positions;

					if (count _spawnPos != 0) then {
						_vehicle = createVehicle [(_params select 0), _spawnPos, [], 0, "CAN_COLLIDE"];
						_vehicle setDir (getDir _target) + 90;
					};
				}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
				{
					[_x, 0, ["ACE_MainActions", _faction, _vehicleGroup], _action] call ace_interact_menu_fnc_addActionToObject;
				} forEach _controllers;
			};
		} forEach _vehicles;
	} forEach _vehicleGroups;
} forEach _factions;
