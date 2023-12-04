params ["_scoreboard", "_scoreboardName"];

if (_scoreboard == objNull) exitWith {};

_scores = profileNamespace getVariable [format ["%1_scores", _scoreboardName], []];
_text = " Scoreboard";

//_sortedShooters = [_shooters, [], {_x getVariable ["practice_hits", 0]}, "DESCEND"] call BIS_fnc_sortBy;

{
	_score = format [" %1 - %2", (_x select 0), (_x select 1)];
	_text = [_text, _score] joinString "\n";
} forEach _scores;

_texture = format ["#(rgb,1024,1024,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _text];

_scoreboard setObjectTextureGlobal [0, _texture];