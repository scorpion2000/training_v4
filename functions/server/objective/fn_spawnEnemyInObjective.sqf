params ["_controller"];

_regulars = _controller getVariable ["enemy_regulars", []];
_special =_controller setVariable ["enemy_special", []];
_unarmed =_controller setVariable ["enemy_unarmed", []];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_specialSpawnChance = 10;
_unarmedSpawnChance = 1;

_regularsInBuildings = 16;
_regularsStatic = 8;
_regularOnPatrol = 6;
_specialTryCount = 4;
_unarmedTryCount = 2;

_buildings = _trigger getVariable ["spawnBuildings", []];
_statics = _trigger getVariable ["staticPositions", []];
_waypoints = _trigger getVariable ["waypointPositions", []];

systemChat format ["%1, %2, %3", count _buildings, count _statics, count _waypoints];
if (count _buildings <= 0 || count _statics <= 0 || count _waypoints <= 2) exitWith {};

_allGroups = [];
_buildingsToUse = [];
_buildingsToUse = +_buildings;

while {_regularsInBuildings > 0} do {
	if (count _buildingsToUse <= 0) then { break; };
	_building = selectRandom _buildingsToUse;
	_buildingsToUse deleteAt (_buildingsToUse find _building);

	_group = createGroup EAST;

	for "_i" from 1 to (random [1, 2, 4]) do {
		_position = selectRandom (_building buildingPos -1);
		_unit = _group createUnit [selectRandom _regulars, _position, [], 0, "CAN_COLLIDE"];

		_unit disableAI "PATH";
		_unit setUnitPos "AUTO";

		_regularsInBuildings = _regularsInBuildings - 1;
		if (_regularsInBuildings <= 0) then { break; };
	};

	_group setBehaviour "SAFE";

	_allGroups pushBack _group;
};

while {_regularsStatic > 0} do {
	_group = createGroup EAST;

	_position = selectRandom _statics;
	_unit = _group createUnit [selectRandom _regulars, _position, [], 0, "CAN_COLLIDE"];

	_unit disableAI "PATH";
	_unit setUnitPos "AUTO";

	_regularsStatic = _regularsStatic - 1;

	_group setBehaviour "SAFE";
	_allGroups pushBack _group;
};

while {_regularOnPatrol > 0} do {
	_group = createGroup EAST;

	for "_i" from 1 to (random [1, 2, 4]) do {
		_position = selectRandom _waypoints;
		_unit = _group createUnit [selectRandom _regulars, _position, [], 3, "CAN_COLLIDE"];

		_unit setUnitPos "AUTO";

		_regularOnPatrol = _regularOnPatrol - 1;
		if (_regularOnPatrol <= 0) then { break; };
	};

	_group setBehaviour "SAFE";
	_waypointsToUse = [];
	_waypointsToUse = +_waypoints;
	for "_i" from 1 to 2 do {
		_wpPos = selectRandom _waypointsToUse;
		while {isNil "_wpPos"} do {
			_wpPos = selectRandom _waypointsToUse;
		};

		_wp = _group addWaypoint [_wpPos, 0];
		_wp setWaypointType "MOVE";

		_waypointsToUse deleteAt (_waypointsToUse find _wpPos);
	};

	_wpRepeat = _group addWaypoint [getPos (leader _group), 0];
	_wpRepeat setWaypointType "CYCLE";

	_allGroups pushBack _group;
};

_currentGroups = _trigger getVariable ["spawnedGroups", []];
_currentGroups append _allGroups;
_trigger setVariable ["spawnedGroups", _currentGroups];