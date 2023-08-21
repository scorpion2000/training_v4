params ["_controllers"];

{
	_faction = _x;
	_action = [_faction, _faction, "", {systemChat "asd";}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;

	_aircrafts = [] call compile preprocessFileLineNumbers (format ["scripts\aircrafts\%1.sqf", _faction]);
	_planes = (_aircrafts select 1);

	{
		_className = (_x select 1);
		_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		_action = [_className, _name, "", {
			params ["_target", "_player", "_params"];
			if !(isNull (_target getVariable ["thisPlane", objNull])) exitWith {systemChat "ERROR: Plane already spawned!"};
			_position = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"spawnPoint"] joinString "_", []];

			_vehicle = createVehicle [(_params select 0), _position, [], 0, "CAN_COLLIDE"];
			_vehicle setDir 180;
			_target setVariable ["thisPlane", _vehicle, true];

			//_vehicle setVariable ["thisOwner", (owner _player), true];
			[_vehicle, _player] remoteExec ["wsot_fnc_assignOwnerId", 2, false];
			_allVehicles = _player getVariable ["enteredVehicles", []];
			_allVehicles pushBack _vehicle;
			_player setVariable ["enteredVehicles", _allVehicles, true];
		}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
		{
			[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
		} forEach _controllers;
	} forEach _planes;
} forEach wsot_allFactionsArray;