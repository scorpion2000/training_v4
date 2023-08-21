params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup",""], "trigger"] joinString "_", objNull];

if (!(_trigger getVariable ["practice_isRunning", false])) exitWith {};

_trigger setVariable ["practice_isRunning", false];
_targets = _trigger getVariable ["targets", []];

sleep 1;

{
	if (admin (owner _x) == 0) then {continue};

	[_allScores] remoteExec ["hint", (owner _x), false];
} forEach allPlayers;

{
	_x removeAllEventHandlers "Hit";
	_x setvariable ["nopop", false, true];
	_x animate ["terc", 0];
} forEach _targets;

[
	_trigger getVariable ["scoreboard", objNull], 
	(_trigger getVariable ["practice_participants", []])
] call wsot_fnc_updateScoreBillboard;

{
	[_x, 2] call wsot_fnc_practiceCallerHint;
} forEach (_trigger getVariable ["practice_participants", []]);

_allScores = "";

{
	_allScores = [_allScores, format ["(%1 - %2)", name _x, _x getVariable ["practice_hits", 0]]] joinString "\n";
} forEach (_trigger getVariable ["practice_participants", []]);

sleep 0.5;
_trigger setVariable ["practice_participants", nil];

[_controller, ""] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];