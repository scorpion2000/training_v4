params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup",""], "trigger"] joinString "_", objNull];

if (!(_trigger getVariable ["practice_isRunning", false])) exitWith {};

_trigger setVariable ["practice_isRunning", false];
_targets = _trigger getVariable ["targets", []];

{
	_x removeAllEventHandlers "Hit";
	_x setvariable ["nopop", false];
	_x animate ["terc", 0];
} forEach _targets;

[
	_trigger getVariable ["scoreboard", objNull], 
	(_trigger getVariable ["practice_participants", []])
] remoteExec ["wsot_fnc_updateScoreBillboard", 2, false];

{
	[_x, 2] remoteExec ["wsot_fnc_practiceCallerHint"];
} forEach (_trigger getVariable ["practice_participants", []]);

_trigger setVariable ["practice_participants", nil];

[_controller, ""] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];