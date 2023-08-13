params ["_trigger", "_distance"];

_zones = missionNamespace getVariable [["arty_impactZones", _distance] joinString "_", []];
_zones pushBack _trigger;
missionNamespace setVariable [["arty_impactZones", _distance] joinString "_", _zones];