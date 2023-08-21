params ["_controller", "_caller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_activeMines = _trigger getVariable ["activeMines", []];

{
	deleteVehicle _x;
} forEach _activeMines;

_trigger setVariable ["activeMines", []];

[format ["Active Mine Count: %1", (count _activeMines)]] remoteExec ["hint", (owner _caller), false];