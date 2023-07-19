params ["_controller", "_controlGroup"];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [0, "images\wsot_flag.paa"];

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

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];
[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_popupToggleText, {
	_trigger = missionNamespace getVariable [[(_this select 0) getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];
	if (_trigger != objNull) then {
		[_trigger] remoteExec ["wsot_fnc_toggleTargetPopups", 2, false];
	};
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];
[_controller, [_targetResetText, {
	_trigger = missionNamespace getVariable [[(_this select 0) getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];
	if (_trigger != objNull) then {
		[_trigger] remoteExec ["wsot_fnc_resetTargets", 2, false];
	};
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_targetPracticeSetup, {
	[(_this select 0)] remoteExec ["wsot_fnc_areaController_practiceSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];