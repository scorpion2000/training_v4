params ["_pos1", "_pos2", "_object", "_id"];

_total = (_object getVariable ["total", 1]) * 10;
_time = (_object getVariable ["lerpPerc", 0]);
if (_time >= _total || _time == 0) then {_time = 0; [_id, true] call BIS_fnc_deltaTime; /*systemChat format ["%1 ; %2", _pos1,_pos2]*/};
_time = _time + ([_id] call BIS_fnc_deltaTime);

//systemChat str _time;

if (_time > _total) then {_time = _total};

_pos = [_pos1,_pos2,(_time / _total)] call BIS_fnc_lerpVector;

_object setPos _pos;
_object setVariable ["lerpPerc", _time];

if (_time < _total) then {
	[_pos1, _pos2, _object, _id] call wsot_fnc_lerp;
} else {
	_object setVariable ["total", (_object getVariable ["total", 1]) + 1];
	[_object, _id] call wsot_fnc_processImages;
};