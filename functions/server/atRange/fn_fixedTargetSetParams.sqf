params ["_controller", "_caller", "_distance", "_rotation"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

_params = _trigger getVariable ["fixedPointRef", [0, 0]];
_object = _trigger getVariable ["fixedPointObj", objNull];

if (isNull _object) exitWith {systemChat "ERROR: Fixed Point Not Registered!"};

_tDistance = _params select 0;
_tRotation = _params select 1;

_tDistance = _tDistance + _distance;
_tRotation = _tRotation + _rotation;

if (_tDistance < 100) then {_tDistance = 100};
if (_tDistance > 1000) then {_tDistance = 1000};

_trigger setVariable ["fixedPointRef", [_tDistance, _tRotation]];

[format ["%1m ; %2rot", _tDistance, _tRotation - (getDir _object)]] remoteExec ["hint", (owner _caller), false];

_fixedTarget = _trigger getVariable ["fixedTarget", objNull];
if (isNull _fixedTarget) exitWith {systemChat "WARNING: No Fixed Target Found!"};
_state = _trigger getVariable ["fixedToggle", false];
if !(_state) exitWith { 	};

_pos = _object modelToWorld [0,_tDistance,0];
_pos = [(_pos select 0), (_pos select 1), 0];
_fixedTarget setPos _pos;
_fixedTarget setDir _tRotation + 180;