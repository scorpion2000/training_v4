params ["_object", "_rangeName"];

_pos = getPosATL _object;
_dir = getDir _object;

missionNamespace setVariable [([_rangeName, "placement"] joinString "_"), [_pos, _dir], true];

deleteVehicle _object;