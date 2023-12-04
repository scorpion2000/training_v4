params ["_vehicle", "_trigger"];

_waypoints = _trigger getVariable ["waypointPositions", []];
if (count _waypoints == 0) exitWith {"ERROR: No waypoints found for moving vehicle setup!"};

_allMovingTargets = _trigger getVariable ["movingTargets", []];
if (count _allMovingTargets >= 3) then {
	_delVeh = _allMovingTargets deleteAt 0;
	_crew = crew _delVeh;
	deleteVehicle _delVeh;
	{
		deleteVehicle _x;
	} forEach _crew;
};

_wpCopy = +_waypoints;
_wpSelection = [];

while {count _wpSelection < 5} do {
	_wp = selectRandom _wpCopy;
	_wpSelection pushBack _wp;
	_wpCopy deleteAt (_wpCopy find _wp);
};

_crew = createGroup EAST;
_unit = _crew createUnit ["O_Survivor_F", [0,0,0], [], 0, "NONE"];
_unit moveInDriver _vehicle;
_crew setBehaviour "CARELESS";

_vehicle setVariable ["thisDriver", _unit];

{
	_wp = _crew addWaypoint [_x, 0];
	_wp setWaypointType "MOVE";
} forEach _wpSelection;
_wp = _crew addWaypoint [(getPos _trigger), 0];
_wp setWaypointType "CYCLE";

_allMovingTargets pushBack _vehicle;
_trigger setVariable ["movingTargets", _allMovingTargets];

_vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_driver = _unit getVariable ["thisDriver", objNull];

	deleteVehicle _driver;
}];