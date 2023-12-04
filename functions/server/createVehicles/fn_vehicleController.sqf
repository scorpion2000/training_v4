params ["_controller", "_controlGroup", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\vehicle.paa"];

waitUntil { !(isNil "wsot_controllerWelcome") };

if (_controlGroup != "") then {
	_controller setVariable ["controlGroup", _controlGroup, true];
} else {
	_controlGroup = _controller getVariable ["controlGroup", "ERROR", true];
};

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _controlGroup, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_useAceText = format ["<t color='#ff5733'>%1</t>", (wsot_useAceMenu select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
/*[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_vehicleController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];*/

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_useAceText, {}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];