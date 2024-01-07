params ["_object", "_id"];

//if (isNil "christmasTextures") exitWith {systemChat "fn_processImages called too early"};

_index = (_object getVariable "index");
if (_index > 4) then {_index = 1};
_to = _index + 1;
if (_to > 4) then {_to = 1};

_fromPos = missionNamespace getVariable format ["movePos_%1", _index];
_toPos = missionNamespace getVariable format ["movePos_%1", _to];

systemChat str _toPos;

_object setVariable ["index", _to];

[getPosATL _fromPos, getPosATL _toPos, _object, _id] call wsot_fnc_lerp;