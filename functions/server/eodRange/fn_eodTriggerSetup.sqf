params ["_trigger", "_rangeName"];

missionNamespace setVariable [([_rangeName, "trigger"] joinString "_"), _trigger, true];