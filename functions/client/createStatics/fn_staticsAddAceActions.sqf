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
			_name = (_x select 0);
			_className = (_x select 1);
			_action = [_className, _name, "", {
				params ["_target", "_player", "_params"];
				_pos = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"placement"] joinString "_", [0,0,0]];
				_static = createVehicle [(_params select 0), _pos, [], 0, "CAN_COLLIDE"];
			}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
			{
				[_x, 0, ["ACE_MainActions", _faction], _action] call ace_interact_menu_fnc_addActionToObject;
			} forEach _controllers;
		};
	} forEach _faction;
} forEach _statics;
