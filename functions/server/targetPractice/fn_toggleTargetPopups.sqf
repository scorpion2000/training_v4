params ["_trigger"];

_targets = _trigger getVariable ["targets", []];
{
	if (_x getVariable ["nopop", true]) then {
		_x setvariable ["nopop", false];
	} else {
		_x setvariable ["nopop", true];
	};
} forEach _targets;