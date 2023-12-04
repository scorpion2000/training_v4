params ["_scoreBoard", "_name", "_score"];

_scores = profileNamespace getVariable [format ["%1_scores",_scoreBoard], []];

_nameIndex = -1;
{
	//This is fucking stupid
	if (_name in _x) then {
		_nameIndex = _forEachIndex;
	}
} forEach _scores;

if (_nameIndex != -1) then {
	if (((_scores select _nameIndex) select 1) < _score) then 
		{ _scores set [_nameIndex, [_name, _score]] };
}
else { _scores pushBack [_name, _score]; };

_sortedScores = [_scores, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy;
profileNamespace setVariable [format ["%1_scores",_scoreBoard], _sortedScores];

_scores