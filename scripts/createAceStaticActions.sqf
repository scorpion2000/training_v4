waitUntil { !(isNil "wsot_allFactionsArray"); };

_staticControllers = [
	hg_request_1,
	hg_request_2,
	hg_request_3,
	hg_request_4,
	hg_request_5,
	hg_request_6
];

[_staticControllers] call wsot_fnc_staticsAddAceActions;

_vehicleControllers = [
	vr_c_1,
	vr_c_2,
	vr_c_3,
	vr_c_4,
	vr_c_5,
	vr_c_6,
	vr_c_7,
	vr_c_8,
	vr_c_9,
	vr_c_10,
	vr_c_11,
	vr_c_12,
	vr_c_13,
	vr_c_14,
	vr_c_15,
	vr_c_16,
	vr_c_17,
	vr_c_18,
	vr_c_19
];

[_vehicleControllers] call wsot_fnc_vehicleAddAceActions;

_helicopterControllers = [
	hr1_c_1,
	hr1_c_2,
	hr1_c_3,
	hr1_c_4,
	hr1_c_5,
	hr2_c_1,
	hr2_c_2,
	hr2_c_3,
	hr2_c_4
];

[_helicopterControllers] call wsot_fnc_helicoptersAddAceActions;

_planeControllers = [
	pr1_c,
	pr2_c,
	pr3_c
];

[_planeControllers] call wsot_fnc_planesAddAceActions;

sleep 5;
_loadoutControllers = missionNamespace getVariable ["lControllers", []];

[_loadoutControllers] call wsot_fnc_loadoutsAddAceActions;

_tpFlags = missionNamespace getVariable ["tpFlags", []];

[_tpFlags] call wsot_fnc_tpFlagcreateActions;

_tpPoles = missionNamespace getVariable ["tpPoles", []];

[_tpPoles] call wsot_fnc_tpPoleCreateActions;