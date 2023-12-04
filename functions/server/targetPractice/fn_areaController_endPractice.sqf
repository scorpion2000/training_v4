params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup",""], "trigger"] joinString "_", objNull];

if (!(_trigger getVariable ["practice_isRunning", false])) exitWith {};

_trigger setVariable ["practice_isRunning", false];
_targets = _trigger getVariable ["targets", []];

_targetCount = _controller getVariable ["wsot_practiceTargets", 6];
_timer = _controller getVariable ["wsot_practiceTimer", 40];

sleep 1;

{
	_x removeAllEventHandlers "Hit";
	_x setvariable ["nopop", false, true];
	_x animate ["terc", 0];
} forEach _targets;

_allScores = "";

{
	if (_targetCount == 6 && _timer == 40) then
	{
		_scores = [
			_controller getVariable ["controlGroup", "ERROR"],
			(name _x),
			(_x getVariable ["practice_hits", 0])
		] call wsot_fnc_scorePersistance;

		[
			_trigger getVariable ["scoreboard", objNull],
			_controller getVariable ["controlGroup", "ERROR"]
		] call wsot_fnc_updateScoreBillboard;
	};
	_allScores = [_allScores, format ["(%1 - %2)", name _x, _x getVariable ["practice_hits", 0]]] joinString "\n";
} forEach (_trigger getVariable ["practice_participants", []]);

{
	if (admin (owner _x) == 0) then {continue};

	[_allScores] remoteExec ["hint", (owner _x), false];
} forEach allPlayers;

{
	[_x, 2] call wsot_fnc_practiceCallerHint;
} forEach (_trigger getVariable ["practice_participants", []]);

sleep 0.5;
_trigger setVariable ["practice_participants", nil];

[_controller, ""] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];