params ["_controller", "_rangeName", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\wsot_flag.paa"];

if (_rangeName != "") then {
	_controller setVariable ["rangeName", _rangeName];
} else {
	_rangeName = _controller getVariable ["rangeName", "ERROR"];
};

if (count (_controller getVariable ["enemy_car", []]) <= 0) then {
	[_controller, "csat"] remoteExec ["wsot_fnc_setRangeEnemyType", 2, false];
};

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _rangeName, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_generateCarText = format ["<t color='#1ad620'>%1</t>", (wsot_rangeGenerateCar select wsot_preferedLanguage)];
_generateAPCText = format ["<t color='#1ad620'>%1</t>", (wsot_rangeGenerateAPC select wsot_preferedLanguage)];
_generateTankText = format ["<t color='#1ad620'>%1</t>", (wsot_rangeGenerateTank select wsot_preferedLanguage)];
_deleteVehiclesText = format ["<t color='#ff5733'>%1</t>", (wsot_removeAllVehicles select wsot_preferedLanguage)];
_selectFactionText = format ["<t color='#ffffff'>%1</t>", (wsot_selectFaction select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_generateCarText, {
	[(_this select 0), "car"] remoteExec ["wsot_fnc_vehicleSelection", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_generateAPCText, {
	[(_this select 0), "apc"] remoteExec ["wsot_fnc_vehicleSelection", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_generateTankText, {
	[(_this select 0), "tank"] remoteExec ["wsot_fnc_vehicleSelection", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_deleteVehiclesText, {
	[(_this select 0), "tank"] remoteExec ["wsot_fnc_deleteVehicles", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

{
	[_controller, [[_x, _selectFactionText] joinString " ", {
		[(_this select 0), (_this select 3)] remoteExec ["wsot_fnc_setRangeEnemyType", 2, false];
	}, _x, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
} forEach wsot_allFactionsArray;
