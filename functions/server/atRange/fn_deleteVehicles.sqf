params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

_allVehicles = _trigger getVariable ["allVehicles", []];

{
	if (isNil "_x" || _x == objNull) then {continue};
	deleteVehicle _x;
} forEach _allVehicles;

_trigger setVariable ["allVehicles", []];