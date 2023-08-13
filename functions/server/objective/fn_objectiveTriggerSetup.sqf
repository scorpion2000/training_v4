params ["_trigger", "_objectiveName"];

missionNamespace setVariable [([_objectiveName, "trigger"] joinString "_"), _trigger, true];

_buildings = nearestObjects [_trigger, ["Building", "House"], 1000];
_spawnBuildings = [];
{
	if (count(_x buildingPos -1) > 1) then { _spawnBuildings pushBack _x };
} forEach _buildings;
_targets = _spawnBuildings inAreaArray _trigger;

/*	
	Using nearObjects was kinda onfortunate. It returns any objects inheriting the class we search for.
	This means searching for the "VR_3DSelector_01_default_F" classname also returns the objects 
	with "VR_3DSelector_01_exit_F" class. Hence the typeOf check.
	I could use nearestObjects, but it's using a sorting algorythm by default. Waste of performance.
*/

_staticPositionObjects = (_trigger nearObjects ["VR_3DSelector_01_default_F", 1000]) inAreaArray _trigger;
_staticPositions = [];
{
	if (typeOf _x != "VR_3DSelector_01_default_F") then {continue};
	_staticPositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _staticPositionObjects;

_waypointPositionObjects = (_trigger nearObjects ["VR_3DSelector_01_incomplete_F", 1000]) inAreaArray _trigger;
_waypointPositions = [];
{
	if (typeOf _x != "VR_3DSelector_01_incomplete_F") then {continue};
	_waypointPositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _waypointPositionObjects;

_objectivePositionObjects = (_trigger nearObjects ["VR_3DSelector_01_exit_F", 1000]) inAreaArray _trigger;
_objectivePositions = [];
{
	if (typeOf _x != "VR_3DSelector_01_exit_F") then {continue};
	_objectivePositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _objectivePositionObjects;

_trigger setVariable ["spawnBuildings", _targets];
_trigger setVariable ["staticPositions", _staticPositions];
_trigger setVariable ["waypointPositions", _waypointPositions];
_trigger setVariable ["objectivePositions", _objectivePositions];