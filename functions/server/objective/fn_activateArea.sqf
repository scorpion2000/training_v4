params ["_controller", "_callingPlayer"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_enemyGroups = _trigger getVariable ["spawnedGroups", []];
_newGroups = [];

{
	_group = _x;
	_allUnits = units _group;
	_newGroup = createGroup EAST;

	_newGroup copyWaypoints _group;
	_allUnits joinSilent _newGroup;
	_newGroups pushBack _newGroup;
} forEach _enemyGroups;

if (isNull _callingPlayer) exitWith {}; 
[
	(format ["%1 %2", 
		count _enemyGroups,
		wsot_objectiveWarnSideChange select wsot_preferedLanguage
	])
] remoteExec ["hint", (owner _callingPlayer), false];

_enemyGroups = _trigger setVariable ["spawnedGroups", _newGroups];