params ["_trigger", "_previousTarget"];

_targets = _trigger getVariable ["targets", []];
_target = objNull;
_foundHitTarget = false;

while {!_foundHitTarget} do {
	_target = selectRandom _targets;
	if (_target getVariable ["practice_isHit", false]) then {
		_foundHitTarget = true;
	};
};

_target setVariable ["practice_isHit", false];
_target animate ["terc", 0];