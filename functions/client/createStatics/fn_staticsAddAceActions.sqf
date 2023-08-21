params ["_controllers"];

_statics = [] call compile preprocessFileLineNumbers "scripts\statics\allStatics.sqf";
_faction = "";

{
	_faction = _x;
	{
		if (_foreachIndex == 0) then {
			_faction = _x;
			_action = [_faction, _faction, "", {}, {true}] call ace_interact_menu_fnc_createAction;
			{
				[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
			} forEach _controllers;
		} else {
			_className = (_x select 1);
			_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
			_action = [_className, _name, "", {
				params ["_target", "_player", "_params"];
				_pos = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"placement"] joinString "_", [0,0,0]];
				_prevCrate = _target getVariable ["prevStatic", objNull];
				if !(isNull _prevCrate) then {
					if (_prevCrate distance (getPos _position) < 3) then {
						deleteVehicle _prevCrate;
					};
				};

				_static = createVehicle [(_params select 0), _pos, [], 0, "CAN_COLLIDE"];
				_target setVariable ["prevStatic", _vehicle, true];

				//_static setVariable ["thisOwner", (owner _player), true];
				[_static, _player] remoteExec ["wsot_fnc_assignOwnerId", 2, false];
				_allVehicles = _player getVariable ["enteredVehicles", []];
				_allVehicles pushBack _static;
				_player setVariable ["enteredVehicles", _allVehicles, true];
			}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
			{
				[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
			} forEach _controllers;
		};
	} forEach _faction;
} forEach _statics;