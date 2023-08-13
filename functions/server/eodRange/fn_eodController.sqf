params ["_controller", "_controlGroup", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\vehicle.paa"];

if (_controlGroup != "") then {
	_controller setVariable ["controlGroup", _controlGroup, true];
} else {
	_controlGroup = _controller getVariable ["controlGroup", "ERROR", true];
};

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _controlGroup, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_atMineGenText = format ["<t color='#f5bf42'>%1</t>", (wsot_eodAtMineGen select wsot_preferedLanguage)];
_apMineGenText = format ["<t color='#f5bf42'>%1</t>", (wsot_eodApMineGen select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_eodController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_atMineGenText, {
	[(_this select 0), "at"] remoteExec ["wsot_fnc_generateMines", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_apMineGenText, {
	[(_this select 0), "ap"] remoteExec ["wsot_fnc_generateMines", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];