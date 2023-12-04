params ["_trigger", "_rangeName"];

missionNamespace setVariable [([_rangeName, "trigger"] joinString "_"), _trigger, true];

_waypointPositionObjects = (_trigger nearObjects ["VR_3DSelector_01_default_F", 1000]) inAreaArray _trigger;
_waypointPositions = [];
{
	_waypointPositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _waypointPositionObjects;

_trigger setVariable ["waypointPositions", _waypointPositions, true];