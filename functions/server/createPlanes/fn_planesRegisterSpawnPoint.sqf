params ["_object", "_controlGroup"];

_pos = getPos _object;
missionNamespace setVariable [[_controlGroup, "spawnPoint"] joinString "_", _pos, true];

deleteVehicle _object;