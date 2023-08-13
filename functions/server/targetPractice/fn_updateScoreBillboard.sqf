params ["_scoreboard", "_shooters"];

if (_scoreboard == objNull) exitWith {};

_text = " Scoreboard";

_sortedShooters = [_shooters, [], {_x getVariable ["practice_hits", 0]}, "DESCEND"] call BIS_fnc_sortBy;

{
	_score = format [" %1 - %2", name _x, _x getVariable ["practice_hits", 0]];
	_text = [_text, _score] joinString "\n";
} forEach _sortedShooters;

_texture = format ["#(rgb,1024,1024,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _text];

_scoreboard setObjectTextureGlobal [0, _texture];