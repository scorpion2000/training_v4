params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];

_targets = _trigger getVariable ["targets", []];
systemChat str count _targets;
{
	if (_x getVariable ["nopop", true]) then {
		_x setvariable ["nopop", false];
	} else {
		_x setvariable ["nopop", true];
	};
} forEach _targets;