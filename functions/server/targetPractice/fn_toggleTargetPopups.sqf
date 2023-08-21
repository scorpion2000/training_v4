params ["_controller", "_caller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];

_targets = _trigger getVariable ["targets", []];
_popup = false;
systemChat str count _targets;
{
	if (_x getVariable ["nopop", true]) then {
		_x setvariable ["nopop", false, true];
		_popup = false;
	} else {
		_x setvariable ["nopop", true, true];
		_popup = true;
	};
} forEach _targets;

[format ["Auto popup %1", if (_popup) then {"disabled"} else {"enabled"}]] remoteExec ["hint", (owner _caller), false];