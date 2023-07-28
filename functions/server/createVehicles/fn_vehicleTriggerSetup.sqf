params ["_trigger", "_controlGroup"];

missionNamespace setVariable [([_controlGroup, "trigger"] joinString "_"), _trigger, true];

_spawnPositionObjects = (_trigger nearObjects ["VR_3DSelector_01_default_F", 1000]) inAreaArray _trigger;
_spawnPositions = [];
{
	_spawnPositions pushBack (getPosATL _x);
	deleteVehicle _x;
} forEach _spawnPositionObjects;

_trigger setVariable ["spawnPositions", _spawnPositions, true];