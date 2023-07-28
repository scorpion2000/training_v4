params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup",""], "trigger"] joinString "_", objNull];
_targetCount = _controller getVariable ["wsot_practiceTargets", 1];
_timer = _controller getVariable ["wsot_practiceTimer", 30];

sleep 1;

if (_trigger getVariable ["practice_isRunning", false]) exitWith {};
if (_targetCount <= 0 || _timer <= 0) exitWith {};


_trigger setVariable ["practice_isRunning", true];
_targets = _trigger getVariable ["targets", []];

{
	_x setvariable ["nopop", true, true];
	_x animate ["terc", 1];
	_x setVariable ["practice_isHit", true];
	_x addEventHandler ["Hit", {
		(_this select 0) setVariable ["practice_isHit", true];
		[
			((_this select 0) getVariable ["parentTrigger", objNull]), 
			(_this select 0)
		] remoteExec ["wsot_fnc_randomTargetPopup", 2, false];
		if !((_this select 0) getVariable ["practice_isHit", false]) then {
			[(_this select 0), (_this select 1)] remoteExec ["wsot_fnc_practiceRegisterShooter", 2, false];
		};
	}];
} forEach _targets;

[_controller, _timer, _targetCount] execVM "scripts\runPracticeProgram.sqf";