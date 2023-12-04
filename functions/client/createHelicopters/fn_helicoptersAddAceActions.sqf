params ["_controllers"];

{
	_faction = _x;
	_action = [_faction, _faction, "", {systemChat "asd";}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;

	_aircrafts = [] call compile preprocessFileLineNumbers (format ["scripts\aircrafts\%1.sqf", _faction]);
	_helicopters = (_aircrafts select 0);

	{
		_className = (_x select 1);
		_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		_action = [_className, _name, "", {
			params ["_target", "_player", "_params"];
			_trigger = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"trigger"] joinString "_", objNull];
			_positions = _trigger getVariable ["spawnPositions", []];
			_sortedPositions = [_positions, [], {_x distance _player}, "ASCEND"] call BIS_fnc_sortBy;
			_spawnPos = [];
			{
				if (count _spawnPos != 0) then {break};
				_spawnPos = _x findEmptyPosition [0,1,(_params select 0)];
			} forEach _sortedPositions;

			_vehicle = objNull;
			if (count _spawnPos != 0) then {
				_vehicle = createVehicle [(_params select 0), _spawnPos, [], 0, "CAN_COLLIDE"];
				_vehicle setDir (getDir _target);
			};

			//_vehicle setVariable ["thisOwner", (owner _player), true];
			[_vehicle, _player] call wsot_fnc_setBullshitId;
			[_vehicle, _player] remoteExec ["wsot_fnc_assignOwnerId", 2, false];
			_allVehicles = _player getVariable ["enteredVehicles", []];
			_allVehicles pushBack _vehicle;
			_player setVariable ["enteredVehicles", _allVehicles, true];
			_vehicle addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				[_unit] remoteExec ["wsot_fnc_delayedRemoval", 2, false];
			}];
		}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
		{
			[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
		} forEach _controllers;
	} forEach _helicopters;
} forEach wsot_allFactionsArray;