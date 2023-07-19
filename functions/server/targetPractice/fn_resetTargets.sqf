params ["_trigger"];

_targets = _trigger getVariable ["targets", []];
{
	_x animate ["terc", 0];
} forEach _targets;