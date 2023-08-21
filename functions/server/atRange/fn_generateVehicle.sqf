params ["_controller", "_vehicleType"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

_allVehicles = _trigger getVariable ["allVehicles", []];

_safePosition = [];
if (_trigger getVariable ["fixedToggle", false]) then {
	_currentTarget = _trigger getVariable ["fixedTarget", objNull];
	deleteVehicle _currentTarget;
	sleep 0.1;	//I think vehicle deletion happens the frame after we call the function. Best be sure..

	_obj = _trigger getVariable ["fixedPointObj", objNull];
	_params = _trigger getVariable ["fixedPointRef", objNull];
	_safePosition = _obj modelToWorld [0,(_params select 0),0];
	_safePosition = [(_safePosition select 0), (_safePosition select 1), 0];
} else {
	_randomPosition = _trigger call BIS_fnc_randomPosTrigger;
	_safePosition = [_randomPosition, 0, 100, 5, 0, 0.1, 0] call BIS_fnc_findSafePos;
};

_vehicle = createVehicle [_vehicleType, _safePosition, [], 0, "NONE"];
_vehicle setVariable ["parentTrigger", _trigger];

if (_trigger getVariable ["fixedToggle", false]) then {
	_params = _trigger getVariable ["fixedPointRef", objNull];
	_vehicle setDir ((_params select 1) + 180);
} else {
	_vehicle setDir (random 360);
};

_vehicle addEventHandler ["Hit", { 
	[_this select 0] remoteExec ["wsot_fnc_displayVehicleDamage", 2, false];
}];
_vehicle engineOn true;

if (_trigger getVariable ["fixedToggle", false]) then {
	_trigger setVariable ["fixedTarget", _vehicle];
};

_allVehicles pushBack _vehicle;
_trigger setVariable ["allVehicles", _allVehicles];