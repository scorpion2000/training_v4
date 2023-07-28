params ["_trigger", "_controlGroup"];

missionNamespace setVariable [([_controlGroup, "trigger"] joinString "_"), _trigger, true];

_targets = (_trigger nearObjects ["TargetP_Inf_F", 1000]) inAreaArray _trigger;
_trigger setVariable ["targets", _targets];

{
	_x setvariable ["nopop", false, true];
	_x setVariable ["parentTrigger", _trigger];
	_x setVariable ["practice_isHit", false];
} forEach _targets;