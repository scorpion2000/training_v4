params ["_controller", "_objectiveName"];

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\wsot_flag.paa"];

if (_objectiveName != "") then {
	_controller setVariable ["objectiveName", _objectiveName];
} else {
	_objectiveName = _controller getVariable ["objectiveName", "ERROR"];
};

[_controller, "csat"] remoteExec ["wsot_fnc_setObjectiveEnemyType", 2, false];

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _objectiveName, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_spawnEnemyText = format ["<t color='#ff5733'>%1</t>", (wsot_objectiveSpawnEnemy select wsot_preferedLanguage)];
_removeEnemyText = format ["<t color='#ff5733'>%1</t>", (wsot_objectiveRemoveEnemy select wsot_preferedLanguage)];
_selectCSATText = format ["<t color='#20c781'>%1</t>", (wsot_objectiveSelectCSAT select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];
[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_spawnEnemyText, {
	[(_this select 0)] remoteExec ["wsot_fnc_spawnEnemyInObjective", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];
[_controller, [_removeEnemyText, {
	[(_this select 0)] remoteExec ["wsot_fnc_removeEnemyFromObjective", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];

[_controller, [_selectCSATText, {
	[(_this select 0), "csat"] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, true];