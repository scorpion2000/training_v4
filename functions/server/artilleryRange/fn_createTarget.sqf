params ["_controller", "_caller", "_distance"];

_prevVehicle = _controller getVariable ["target", objNull];

//Safe pos checks CAN happen before vehicle is deleted
sleep 0.05;

_triggers = missionNamespace getVariable [["arty_impactZones", _distance] joinString "_", []];
_randomPos = (selectRandom _triggers) call BIS_fnc_randomPosTrigger;
_safePos = _randomPos findEmptyPosition [0, 100, "B_MRAP_01_F"];

//Let's retry if we can't find a safe pos
if (count _safePos == 0) exitWith {
	systemChat "No safe position found";
	[_controller, _caller] remoteExec ["wsot_fnc_createTarget"]
};

if !(isNull _prevVehicle) then {
	deleteVehicle _prevVehicle;
};

_veh = createVehicle ["B_MRAP_01_F", _safePos, [], 0, "CAN_COLLIDE"];
_controller setVariable ["target", _veh];
_veh setVariable ["controller", _controller];

_veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_controller = _unit getVariable ["controller", objNull];

	if !(isNull _controller) then {
		[_controller, [], _unit] remoteExec ["wsot_fnc_artilleryUpdateDisplay", 2, false];
	};
}];

_veh addEventHandler ["Hit", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_controller = _unit getVariable ["controller", objNull];

	if !(isNull _controller) then {
		[_controller, [], _unit] remoteExec ["wsot_fnc_artilleryUpdateDisplay", 2, false];
	};
}];

[_veh] remoteExec ["wsot_fnc_prepareTarget", (owner _caller), false];