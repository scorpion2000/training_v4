params ["_controller", "_controlGroup", ["_firstTime", false]];

//I can't be arsed to change all the controllers
if (_firstTime && typeOf _controller != "Land_Laptop_03_black_F") then {
	_atlPos = getPosAtl _controller;
	_dir = getDir _controller;
	deleteVehicle _controller;
	_controller = createVehicle ["Land_Laptop_03_black_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_controller setPosATL _atlPos;
	_controller setDir _dir + 180;
};

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\shooting_range.paa"];

if (_controlGroup != "") then {
	_controller setVariable ["controlGroup", _controlGroup];
} else {
	_controlGroup = _controller getVariable ["controlGroup", "ERROR"];
};

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _controlGroup, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_popupToggleText = format ["<t color='#ff5733'>%1</t>", (wsot_controllerDisablePopup select wsot_preferedLanguage)];
_targetResetText = format ["<t color='#ff5733'>%1</t>", (wsot_controllerResetTargets select wsot_preferedLanguage)];
_targetPracticeSetup = format ["<t color='#20c781'>%1</t>", (wsot_controllerTargetPracticeSetup select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_popupToggleText, {
	_trigger = missionNamespace getVariable [[(_this select 0) getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];
	if (_trigger != objNull) then {
		[_trigger] remoteExec ["wsot_fnc_toggleTargetPopups", 2, false];
	};
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_targetResetText, {
	_trigger = missionNamespace getVariable [[(_this select 0) getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];
	if (_trigger != objNull) then {
		[_trigger] remoteExec ["wsot_fnc_resetTargets", 2, false];
	};
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_targetPracticeSetup, {
	[(_this select 0)] remoteExec ["wsot_fnc_areaController_practiceSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];