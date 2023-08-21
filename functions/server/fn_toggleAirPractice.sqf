params ["_caller", "_type"];

switch (_type) do {
	case 0: {
		wsot_uavTargets = if (wsot_uavTargets) then {false} else {true};
		[format ["UAV Targets Are %1", if (wsot_uavTargets) then {"Online"} else {"Offline"}]] remoteExec ["hint", (owner _caller), false];
	};

	case 1: {
		wsot_vehicleTargets = if (wsot_vehicleTargets) then {false} else {true};
		[format ["Bombing Range Targets Are %1", if (wsot_vehicleTargets) then {"Online"} else {"Offline"}]] remoteExec ["hint", (owner _caller), false];
	};
	default { };
};