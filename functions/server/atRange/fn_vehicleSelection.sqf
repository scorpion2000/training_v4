params ["_controller", "_selection"];

_vehicles = [];
_validSelection = true;

switch (_selection) do {
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
};

if (!_validSelection) exitWith { [_controller, ""] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false] };
[_controller] remoteExec ["removeAllActions", 0, false];

_welcomeText = format ["<t color='#f4c430'>%1</t>", (wsot_rangeSelectVehicle select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_exitText = format ["<t color='#20c781'>%1</t>", (wsot_rangeExit select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

{
	_name = format ["<t color='#1ad620'>%1</t>", _x select 0];
	[_controller, [_name, {
		[(_this select 0), (_this select 3)] remoteExec ["wsot_fnc_generateVehicle", 2, false];
	}, (_x select 1), 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
} forEach _vehicles;

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_exitText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];