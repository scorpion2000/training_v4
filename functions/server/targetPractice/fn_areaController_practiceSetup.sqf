params ["_controller"];

[_controller] remoteExec ["removeAllActions", 0, false];

_controller setVariable ["wsot_practiceTargets", 1];
_controller setVariable ["wsot_practiceTimer", 30];

_welcomeText = format ["<t color='#f4c430'>%1</t>", (wsot_controllerTargetPracticeSetup select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_addToTargetText = format ["<t color='#20c781'>%1</t>", (wsot_practiceAddToTarget select wsot_preferedLanguage)];
_removeFromTargetText = format ["<t color='#c72031'>%1</t>", (wsot_practiceRemoveFromTarget select wsot_preferedLanguage)];
_addToTimerText = format ["<t color='#20c781'>%1</t>", (wsot_practiceAddToTimer select wsot_preferedLanguage)];
_removeFromTimerText = format ["<t color='#c72031'>%1</t>", (wsot_practiceRemoveFromTimer select wsot_preferedLanguage)];
_practiceStartText = format ["<t color='#5220c7'>%1</t>", (wsot_practiceStart select wsot_preferedLanguage)];
_practiceEndText = format ["<t color='#5220c7'>%1</t>", (wsot_practiceFinish select wsot_preferedLanguage)];
_exitText = format ["<t color='#20c781'>%1</t>", (wsot_rangeExit select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

[_controller, [_addToTargetText, {
	_targetCount = ((_this select 0) getVariable ["wsot_practiceTargets", 1]) + 1;
	(_this select 0) setVariable ["wsot_practiceTargets", _targetCount, true];
	[(_this select 1), 0, _targetCount] remoteExec ["wsot_fnc_practiceCallerHint", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_removeFromTargetText, {
	_targetCount = ((_this select 0) getVariable ["wsot_practiceTargets", 1]) - 1;
	(_this select 0) setVariable ["wsot_practiceTargets", _targetCount, true];
	[(_this select 1), 0, _targetCount] remoteExec ["wsot_fnc_practiceCallerHint", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_addToTimerText, {
	_timerCount = ((_this select 0) getVariable ["wsot_practiceTimer", 30]) + 10;
	(_this select 0) setVariable ["wsot_practiceTimer", _timerCount, true];
	[(_this select 1), 1, _timerCount] remoteExec ["wsot_fnc_practiceCallerHint", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_removeFromTimerText, {
	_timerCount = ((_this select 0) getVariable ["wsot_practiceTimer", 30]) - 10;
	(_this select 0) setVariable ["wsot_practiceTimer", _timerCount, true];
	[(_this select 1), 1, _timerCount] remoteExec ["wsot_fnc_practiceCallerHint", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

[_controller, [_practiceStartText, {
	[(_this select 0), (_this select 1)] remoteExec ["wsot_fnc_areaController_startPractice", 2, false];
	[(_this select 1), 3] remoteExec ["wsot_fnc_practiceCallerHint", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];
[_controller, [_practiceEndText, {
	[(_this select 0)] remoteExec ["wsot_fnc_areaController_endPractice", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, false];

[_controller, [_exitText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];