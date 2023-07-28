params ["_object", "_staticName"];

_pos = getPosATL _object;

missionNamespace setVariable [([_staticName, "placement"] joinString "_"), _pos, true];

deleteVehicle _object;