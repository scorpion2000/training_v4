params ["_controller", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\plane.paa"];

waitUntil { !(isNil "wsot_controllerWelcome") };

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", "time", (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_resetText, {
	[(_this select 0)] remoteExec ["wsot_fnc_timeDialController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

for "_i" from 1 to 24 do {
	[_controller, [format ["<t color='#1ad620' font='EtelkaMonospaceProBold'>%1:00</t>", _i], {
		[(_this select 3), (_this select 1)] remoteExec ["wsot_fnc_changeTime", 2, false];
	}, _i, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
};
