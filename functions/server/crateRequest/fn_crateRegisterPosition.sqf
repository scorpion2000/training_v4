params ["_object", "_controlGroup"];

missionNamespace setVariable [[_controlGroup, "spawnPoint"] joinString "_", _object, true];