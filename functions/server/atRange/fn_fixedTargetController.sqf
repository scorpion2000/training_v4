params ["_controller", "_rangeName", ["_firstTime", false]];

systemChat "FUCK";

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\fixed.paa"];

if (_rangeName != "") then {
	_controller setVariable ["rangeName", _rangeName];
} else {
	_rangeName = _controller getVariable ["rangeName", "ERROR"];
};

waitUntil { !(isNil "wsot_controllerWelcome") };

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _rangeName, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_toggleText = format ["<t color='#d67813'>%1</t>", (wsot_atFixedToggle select wsot_preferedLanguage)];
_add50Text = format ["<t color='#13d63a'>%1</t>", (wsot_atFixedAdd50m select wsot_preferedLanguage)];
_add100Text = format ["<t color='#13d63a'>%1</t>", (wsot_atFixedAdd100m select wsot_preferedLanguage)];
_sub50Text = format ["<t color='#d61344'>%1</t>", (wsot_atFixedSub50m select wsot_preferedLanguage)];
_sub100Text = format ["<t color='#d61344'>%1</t>", (wsot_atFixedSub100m select wsot_preferedLanguage)];
_posRot30Text = format ["<t color='#13d63a'>%1</t>", (wsot_atFixedRotatePos30 select wsot_preferedLanguage)];
_negRot30Text = format ["<t color='#d61344'>%1</t>", (wsot_atFixedRotateNeg30 select wsot_preferedLanguage)];
_virtualiseText = format ["<t color='#f4c430'>%1</t>", (wsot_atFixedVirtualise select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_toggleText, {
	[(_this select 0), (_this select 1)] remoteExec ["wsot_fnc_fixedTargetToggle", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_add50Text, {
	[(_this select 0), (_this select 1), 50, 0] remoteExec ["wsot_fnc_fixedTargetSetParams", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_add100Text, {
	[(_this select 0), (_this select 1), 100, 0] remoteExec ["wsot_fnc_fixedTargetSetParams", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_sub50Text, {
	[(_this select 0), (_this select 1), -50, 0] remoteExec ["wsot_fnc_fixedTargetSetParams", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_sub100Text, {
	[(_this select 0), (_this select 1), -100, 0] remoteExec ["wsot_fnc_fixedTargetSetParams", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_posRot30Text, {
	[(_this select 0), (_this select 1), 0, 30] remoteExec ["wsot_fnc_fixedTargetSetParams", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_negRot30Text, {
	[(_this select 0), (_this select 1), 0, -30] remoteExec ["wsot_fnc_fixedTargetSetParams", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_virtualiseText, {
	[(_this select 0)] remoteExec ["wsot_fnc_fixedTargetVirtualisation", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];