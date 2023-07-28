params ["_controller", "_vehicleType"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

_allVehicles = _trigger getVariable ["allVehicles", []];

_randomPosition = _trigger call BIS_fnc_randomPosTrigger;
_safePosition = [_randomPosition, 0, 100, 5, 0, 0.1, 0] call BIS_fnc_findSafePos;

_vehicle = createVehicle [_vehicleType, _safePosition, [], 0, "NONE"];
_vehicle setVariable ["parentTrigger", _trigger];
_vehicle setDir (random 360);
_vehicle addEventHandler ["Hit", { 
	[_this select 0] remoteExec ["wsot_fnc_displayVehicleDamage", 2, false];
}];

_allVehicles pushBack _vehicle;
_trigger setVariable ["allVehicles", _allVehicles];