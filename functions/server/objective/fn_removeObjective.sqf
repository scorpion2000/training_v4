params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];
//_trigger setVariable ["objectiveType", ""];
{
	deleteVehicle _x;
} forEach (_trigger getVariable ["objectiveItems", []]);