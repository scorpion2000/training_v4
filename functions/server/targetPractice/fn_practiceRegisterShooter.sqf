params ["_target", "_shooter"];

_trigger = _target getVariable ["parentTrigger", objNull];
if (_trigger == objNull) exitWith {};

_participants = _trigger getVariable ["practice_participants", []];

if !(_shooter in _participants) then {
	_participants pushBack _shooter;
	_trigger setVariable ["practice_participants", _participants];
};

_shooterScore = _shooter getVariable ["practice_hits", 0];
_shooterScore = _shooterScore + 1;
_shooter setVariable ["practice_hits", _shooterScore];