params ["_controller", "_objectiveName", ["_firstTime", false]];

waitUntil { !(isNil "wsot_allFactionsArray") };

[_controller] remoteExec ["removeAllActions", 0, false];
_controller setObjectTextureGlobal [1, "images\objective.paa"];

if (_objectiveName != "") then {
	_controller setVariable ["objectiveName", _objectiveName];
} else {
	_objectiveName = _controller getVariable ["objectiveName", "ERROR"];
};

if (count (_controller getVariable ["enemy_regular", []]) <= 0) then {
	[_controller, "csat", objNull] remoteExec ["wsot_fnc_setObjectiveEnemyType", 2, false];
};

_welcomeText = format ["<t color='#f4c430'>%1 %2</t>", _objectiveName, (wsot_controllerWelcome select wsot_preferedLanguage)];
_resetText = format ["<t color='#eb4034'>%1</t>", (wsot_reset select wsot_preferedLanguage)];
_dividerText = wsot_controllerDivider select wsot_preferedLanguage;
_spawnEnemyText = format ["<t color='#ff5733'>%1</t>", (wsot_objectiveSpawnEnemy select wsot_preferedLanguage)];
_removeEnemyText = format ["<t color='#ff5733'>%1</t>", (wsot_objectiveRemoveEnemy select wsot_preferedLanguage)];
_selectFactionText = format ["<t color='#ffffff'>%1</t>", (wsot_selectFaction select wsot_preferedLanguage)];
_vipRescueMissionText = format ["<t color='#1ad620'>%1</t>", (wsot_objectiveGenerateVIP select wsot_preferedLanguage)];
_radarMissionText = format ["<t color='#1ad620'>%1</t>", (wsot_objectiveGenerateRadar select wsot_preferedLanguage)];
_removeMissionText = format ["<t color='#eb4034'>%1</t>", (wsot_objectiveRemoveMission select wsot_preferedLanguage)];
_activateObjectiveText = format ["<t color='#f4c430'>%1</t>", (wsot_objectiveActivateObjective select wsot_preferedLanguage)];

[_controller, [_welcomeText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_resetText, {
	[(_this select 0), ""] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_spawnEnemyText, {
	[(_this select 0), (_this select 1)] remoteExec ["wsot_fnc_spawnEnemyInObjective", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_removeEnemyText, {
	[(_this select 0)] remoteExec ["wsot_fnc_removeEnemyFromObjective", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_activateObjectiveText, {
	[(_this select 0), (_this select 1)] remoteExec ["wsot_fnc_activateArea", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_vipRescueMissionText, {
	[(_this select 0)] remoteExec ["wsot_fnc_objectiveGenerateVip", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_radarMissionText, {
	[(_this select 0)] remoteExec ["wsot_fnc_objectiveGenerateRadar", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
[_controller, [_removeMissionText, {
	[(_this select 0)] remoteExec ["wsot_fnc_removeObjective", 2, false];
}, nil, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

[_controller, [_dividerText, {}, nil, 1, true, false, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];

{
	[_controller, [[_x, _selectFactionText] joinString " ", {
		[(_this select 0), (_this select 3), (_this select 1)] remoteExec ["wsot_fnc_setObjectiveEnemyType", 2, false];
	}, _x, 1, true, true, "", "true", 8, false, "", ""]] remoteExec ["addAction", 0, _firstTime];
} forEach wsot_allFactionsArray;