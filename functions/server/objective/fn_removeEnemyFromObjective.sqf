params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_allGroups = _trigger getVariable ["spawnedGroups", []];
systemChat str (count _allGroups);
if (count _allGroups <= 0) exitWith {};

{
	_group = _x;
	{
		deleteVehicle _x;
	} forEach (units _group);
} forEach _allGroups;