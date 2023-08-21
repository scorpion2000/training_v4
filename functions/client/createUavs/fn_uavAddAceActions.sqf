params ["_controllers"];

{
	_faction = _x;
	_action = [_faction, _faction, "", {systemChat "asd";}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;

	_uavs = [] call compile preprocessFileLineNumbers (format ["scripts\uavs\%1.sqf", _faction]);

	{
		_className = _x;
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
				_vehicle setDir 180;
				_grp = createVehicleCrew _vehicle;
				_bluGrp = createGroup BLUFOR;
				(units _grp) joinSilent _bluGrp;
			};

			//_vehicle setVariable ["thisOwner", (owner _player), true];
			[_vehicle, _player] remoteExec ["wsot_fnc_assignOwnerId", 2, false];
			_allVehicles = _player getVariable ["enteredVehicles", []];
			_allVehicles pushBack _vehicle;
			_player setVariable ["enteredVehicles", _allVehicles, true];
		}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
		{
			[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
		} forEach _controllers;
	} forEach _uavs;
} forEach wsot_allFactionsArray;