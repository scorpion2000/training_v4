params ["_controller", "_rangeName", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\wip.paa"];

if (_rangeName != "") then {
	_controller setVariable ["rangeName", _rangeName];
} else {
	_rangeName = _controller getVariable ["rangeName", "ERROR"];
};

waitUntil { !(isNil "wsot_controllerWelcome") };

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _rangeName, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_toggleText = format ["<t color='#d67813'>%1</t>", (wsot_movingTargetToggle select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_toggleText, {
	[(_this select 0), (_this select 1)] remoteExec ["wsot_fnc_movingTargetToggle", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];