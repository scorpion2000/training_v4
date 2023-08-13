params ["_controller", "_selection"];

_vehicles = [];

/*switch (_selection) do {
	case "car": {
		_vehicles = +(_controller getVariable ["enemy_car", []]);
	};
	case "apc": {
		_vehicles = +(_controller getVariable ["enemy_apc", []]);
	};
	case "tank": {
		_vehicles = +(_controller getVariable ["enemy_tank", []]);
	};
	
	default { _validSelection = false };
};*/

_faction = _controller getVariable ["thisFaction", "csat"];
_allVehicles = [] call compile preprocessFileLineNumbers (format ["scripts\vehicles\%1.sqf", _faction]);
{
	_groupName = ((_x select 0) select 1);
	if (_groupName == _selection) then {_vehicles = _x; break;};
} forEach _allVehicles;

[_controller] remoteExec ["removeAllActions", 0, false];

_welcomeText = format ["<t color='#f4c430'>%1</t>", (wsot_rangeSelectVehicle select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_exitText = format ["<t color='#20c781'>%1</t>", (wsot_rangeExit select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

{
	if (_foreachIndex == 0) then {continue};
	_name = format ["<t color='#1ad620'>%1</t>", _x select 0];
	[_controller, [_name, {
		[(_this select 0), (_this select 3)] remoteExec ["wsot_fnc_generateVehicle", 2, false];
	}, (_x select 1), 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
} forEach _vehicles;

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_exitText, {
	[(_this select 0), "", (_this select 3)] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
}, _faction, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];