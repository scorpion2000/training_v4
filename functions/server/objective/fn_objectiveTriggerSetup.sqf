params ["_trigger", "_objectiveName"];

missionNamespace setVariable [([_objectiveName, "trigger"] joinString "_"), _trigger, true];

_buildings = nearestObjects [_trigger, ["Building", "House"], 1000];
_spawnBuildings = [];
{
	if (count(_x buildingPos -1) > 1) then { _spawnBuildings pushBack _x };
} forEach _buildings;
_targets = _spawnBuildings inAreaArray _trigger;

_staticPositionObjects = (_trigger nearObjects ["VR_3DSelector_01_default_F", 1000]) inAreaArray _trigger;
_staticPositions = [];
{
	_staticPositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _staticPositionObjects;

_waypointPositionObjects = (_trigger nearObjects ["VR_3DSelector_01_incomplete_F", 1000]) inAreaArray _trigger;
_waypointPositions = [];
{
	_waypointPositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _waypointPositionObjects;

_trigger setVariable ["spawnBuildings", _targets];
_trigger setVariable ["staticPositions", _staticPositions];
_trigger setVariable ["waypointPositions", _waypointPositions];