params ["_controller", "_rangeName", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\artillery.paa"];

waitUntil { !(isNil "wsot_controllerWelcome") };

if (_rangeName != "") then {
	_controller setVariable ["rangeName", _rangeName, true];
} else {
	_rangeName = _controller getVariable ["rangeName", "ERROR", true];
};

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _rangeName, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_selectSmal1Text = format ["<t color='#1ad620'>%1</t>", (wsot_artySelectSmall1 select wsot_preferedLanguage)];
_selectSmal2Text = format ["<t color='#1ad620'>%1</t>", (wsot_artySelectSmall2 select wsot_preferedLanguage)];
_selectLargeText = format ["<t color='#1ad620'>%1</t>", (wsot_artySelectLarge select wsot_preferedLanguage)];
_selectMoverText = format ["<t color='#1ad620'>%1</t>", (wsot_artySelectMover select wsot_preferedLanguage)];
_createTargetCloseText = format ["<t color='#b82525'>%1</t>", (wsot_artyCreateTargetClose select wsot_preferedLanguage)];
_createTargetFarText = format ["<t color='#b82525'>%1</t>", (wsot_artyCreateTargetFar select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
/*[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_artilleryController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];*/

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_selectSmal1Text, {
	[(_this select 0), "B_Mortar_01_F"] remoteExec ["wsot_fnc_createArtillery", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_selectSmal2Text, {
	[(_this select 0), "RHS_M252_D"] remoteExec ["wsot_fnc_createArtillery", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_selectLargeText, {
	[(_this select 0), "RHS_M119_D"] remoteExec ["wsot_fnc_createArtillery", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_selectMoverText, {
	[(_this select 0), "rhsusf_m109d_usarmy"] remoteExec ["wsot_fnc_createArtillery", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_createTargetCloseText, {
	[(_this select 0), (_this select 1), "close"] remoteExec ["wsot_fnc_createTarget", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_createTargetFarText, {
	[(_this select 0), (_this select 1), "far"] remoteExec ["wsot_fnc_createTarget", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];