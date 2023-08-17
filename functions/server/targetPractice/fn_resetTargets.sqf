params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup", ""], "trigger"] joinString "_", objNull];

_targets = _trigger getVariable ["targets", []];
{
	_x animate ["terc", 0];
} forEach _targets;