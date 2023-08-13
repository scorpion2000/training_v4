params ["_object", "_rangeName"];

missionNamespace setVariable [([_rangeName, "display"] joinString "_"), _object, true];