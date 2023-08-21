params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

if (_trigger getVariable ["fixedVirtualise", false]) exitWith { _trigger setVariable ["fixedVirtualise", false] };

_params = _trigger getVariable ["fixedVirtRef", []];
_params2 = _trigger getVariable ["fixedPointRef", []];
_object = _trigger getVariable ["fixedPointObj", objNull];
if (count _params == 0) exitWith {systemChat "ERROR: Virtualisation Position Not Registered!"};
if (count _params2 == 0 || isNull _object) exitWith {systemChat "ERROR: Fixed Point Not Registered!"};

_target = _trigger getVariable ["fixedTarget", objNull];
if (isNull _target) then {systemChat "ERROR: No Target Found!"};

_target enableSimulationGlobal false;
_target allowDamage false;

_trigger setVariable ["fixedVirtualise", true];

_target setPosATL (_params select 0);
_target setDir (_params select 1);
sleep 0.5;
while { _trigger getVariable "fixedVirtualise" } do {
	_target setDir ((getDir _target) + 30);
	sleep 0.5;
};

_target enableSimulationGlobal true;
_target allowDamage true;

_pos = _object modelToWorld [0,(_params2 select 0),0];
_pos = [(_pos select 0), (_pos select 1), 0];
_target setPos _pos;
_target setDir (_params2 select 1) + 180;