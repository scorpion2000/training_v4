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
	vr_c_19,
	vr_c_20,
	vr_c_21,
	vr_c_22,
	vr_c_23,
	vr_c_24,
	vr_c_25,
	vr_c_26,
	vr_c_27,
	vr_c_28,
	vr_c_29,
	vr_c_30,
	vr_c_31,
	vr_c_32,
	vr_c_33
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
	pr3_c,
	pr4_c,
	pr5_c,
	pr6_c,
	pr7_c,
	pr8_c
];

[_planeControllers] call wsot_fnc_planesAddAceActions;

sleep 3;

_loadoutControllers = missionNamespace getVariable ["lControllers", []];
[_loadoutControllers] call wsot_fnc_loadoutsAddAceActions;

_tpFlags = missionNamespace getVariable ["tpFlags", []];
[_tpFlags] call wsot_fnc_tpFlagcreateActions;

_tpPoles = missionNamespace getVariable ["tpPoles", []];
[_tpPoles] call wsot_fnc_tpPoleCreateActions;

_rcPoles = missionNamespace getVariable ["rcPoles", []];
[_rcPoles] call wsot_fnc_tpPoleCreateActions;

//I think the script gets stuck here, need to investigate
_boatControllers = missionNamespace getVariable ["bControllers", []];
[_boatControllers] call wsot_fnc_boatAddAceActions;