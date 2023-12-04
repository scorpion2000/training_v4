params ["_controller", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [0, "images\equipment.paa"];
[_controller, true] call ace_arsenal_fnc_initBox;

waitUntil { !(isNil "wsot_controllerWelcome") };

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", "Loadout", (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_useAceText = format ["<t color='#ff5733'>%1</t>", (wsot_useAceMenu select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
/*[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_loadoutController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];*/

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_useAceText, {}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];