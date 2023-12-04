params ["_controller", "_caller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

_trigger setVariable ["fixedToggle", false];

_state = _trigger getVariable ["movingToggle", false];
_state = if (_state) then {false} else {true};
_trigger setVariable ["movingToggle", _state];

[format ["Moving targets are %1", if (_state) then {"enabled"} else {"disabled"}]] remoteExec ["hint", (owner _caller), false];