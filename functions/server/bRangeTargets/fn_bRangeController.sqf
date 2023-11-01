params ["_controller", ["_firstTime", false]];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\bRange.paa"];

waitUntil { !(isNil "wsot_controllerWelcome") };
waitUntil { !(isNil "wsot_allFactionsBRange") };

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", "bRange", (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_allCategories = ["car", "carNavy", "truck", "apc", "ifv", "artillery", "tank", "antiTank", "antiAir"];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
/*[_controller, [_resetText, {
	[(_this select 0)] remoteExec ["wsot_fnc_bRangeController", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];*/

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

{
	_found = _x in wsot_allFactionsBRange;
	[_controller, [format ["%1 %2", if (_found) then {"+"} else {"-"}, _x], {
		[
			(_this select 0), 
			((_this select 3) select 0), 
			true, 
			((_this select 3) select 1)
			] remoteExec ["wsot_fnc_changeBRangeTargets", 2, false];
	}, [_x, _found], 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
} forEach wsot_allFactionsArray;

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

{
	_found = _x in wsot_allTypesBRange;
	[_controller, [format ["%1 %2", if (_found) then {"+"} else {"-"}, _x], {
		[
			(_this select 0), 
			((_this select 3) select 0), 
			false, 
			((_this select 3) select 1)
			] remoteExec ["wsot_fnc_changeBRangeTargets", 2, false];
	}, [_x, _found], 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
} forEach _allCategories;