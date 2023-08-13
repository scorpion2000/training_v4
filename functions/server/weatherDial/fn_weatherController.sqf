params ["_controller", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\plane.paa"];

waitUntil { !(isNil "wsot_controllerWelcome") };

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", "weather", (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_weatherClearText = format ["<t color='#1ad620'>%1</t>", (wsot_weatherClear select wsot_preferedLanguage)];
_weatherCloudyText = format ["<t color='#1ad620'>%1</t>", (wsot_weatherCloudy select wsot_preferedLanguage)];
_weatherRainyText = format ["<t color='#1ad620'>%1</t>", (wsot_weatherRainy select wsot_preferedLanguage)];
_weatherStormyText = format ["<t color='#1ad620'>%1</t>", (wsot_weatherStormy select wsot_preferedLanguage)];
_fogNoneText = format ["<t color='#20c781'>%1</t>", (wsot_weatherFogNone select wsot_preferedLanguage)];
_fogLowText = format ["<t color='#20c781'>%1</t>", (wsot_weatherFogSmall select wsot_preferedLanguage)];
_fogMidText = format ["<t color='#20c781'>%1</t>", (wsot_weatherFogMid select wsot_preferedLanguage)];
_fogHighText = format ["<t color='#20c781'>%1</t>", (wsot_weatherFogHigh select wsot_preferedLanguage)];


[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_resetText, {
	[(_this select 0)] remoteExec ["wsot_fnc_timeDialController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_weatherClearText, {
	["clear", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_weatherCloudyText, {
	["cloudy", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_weatherRainyText, {
	["rainy", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_weatherStormyText, {
	["stormy", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_fogNoneText, {
	["fogNone", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_fogLowText, {
	["fogLow", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_fogMidText, {
	["fogMid", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_fogHighText, {
	["fogHigh", (_this select 1)] remoteExec ["wsot_fnc_changeWeather", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];