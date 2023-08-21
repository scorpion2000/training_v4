params ["_controllers"];

{
	_faction = _x;
	_action = [_faction, _faction, "", {systemChat "asd";}, {true}] call ace_interact_menu_fnc_createAction;
	{
		[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _controllers;

	_crates = [] call compile preprocessFileLineNumbers (format ["scripts\crates\%1.sqf", _faction]);

	{
		_className = _x;
		_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		_action = [_className, _name, "", {
			params ["_target", "_player", "_params"];
			_position = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"spawnPoint"] joinString "_", []];
			_prevCrate = _target getVariable ["prevCrate", objNull];
			if !(isNull _prevCrate) then {
				if (_prevCrate distance (getPos _position) < 3) then {
					deleteVehicle _prevCrate;
				};
			};

			_vehicle = createVehicle [(_params select 0), _position, [], 0, "CAN_COLLIDE"];
			_target setVariable ["prevCrate", _vehicle, true];

			//_vehicle setVariable ["thisOwner", (owner _player), true];
			[_vehicle, _player] remoteExec ["wsot_fnc_assignOwnerId", 2, false];
			_allVehicles = _player getVariable ["enteredVehicles", []];
			_allVehicles pushBack _vehicle;
			_player setVariable ["enteredVehicles", _allVehicles, true];
		}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
		{
			[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
		} forEach _controllers;
	} forEach _crates;
} forEach wsot_allFactionsArray;