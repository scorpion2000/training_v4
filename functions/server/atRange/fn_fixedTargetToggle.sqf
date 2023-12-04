params ["_controller", "_caller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["rangeName",""], "trigger"] joinString "_", objNull];

_trigger setVariable ["movingToggle", false];

_state = _trigger getVariable ["fixedToggle", false];
_state = if (_state) then {false} else {true};
_trigger setVariable ["fixedToggle", _state];

[format ["Fixed targets are %1", if (_state) then {"enabled"} else {"disabled"}]] remoteExec ["hint", (owner _caller), false];