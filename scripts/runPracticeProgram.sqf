params ["_controller", "_timer", "_targetCount"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup",""], "trigger"] joinString "_", objNull];
_targets = _trigger getVariable ["targets", []];

sleep 3;

for "_i" from 1 to _targetCount do {
	[_trigger, objNull] remoteExec ["wsot_fnc_randomTargetPopup", 2, false];
};

while {_timer > 0} do {
	[_controller, _timer] remoteExec ["wsot_fnc_controllerCountdown", 2, false];
	sleep 1;
	_timer = _timer - 1;
};

[_controller] remoteExec ["wsot_fnc_areaController_endPractice", 2, false];