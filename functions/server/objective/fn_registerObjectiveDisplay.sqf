params ["_object", "_trigger"];

_allDisplays = _trigger getVariable ["objectiveDisplays",[]];
_alldisplays pushback _object;
_allDisplays = _trigger setVariable ["objectiveDisplays", _alldisplays];
