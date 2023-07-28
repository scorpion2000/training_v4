/*	The arrays should contain all factions we wish to use	*/
/*	NOTE: FIRST ELEMENT MUST BE THE CLASS NAME, REST FORMAT = ["DISPLAY NAME", "CLASSNAME"]	*/
/*	SIDENOTE: CLASSNAMES ARE CASE SENSITIVE	*/

_natoStatic = [
	"Nato",
	["M-47 Super-Dragon", "ace_dragon_staticAssembled"],
	["Mini Spike Launcher (AT)", "B_static_AT_F"],
	["Mini Spike Launcher (AA)", "B_static_AA_F"],
	["Spotting Scope", "ACE_B_SpottingScope"],
	["XM307", "B_GMG_01_F"],
	["XM307 (High)", "B_GMG_01_high_F"],
	["XM307A", "B_GMG_01_A_F"],
	["XM312", "B_HMG_01_F"],
	["XM312 (High)", "B_HMG_01_high_F"],
	["XM312A", "B_HMG_01_A_F"]
];

_csatStatic = [
	"CSAT",
	["Mini Spike Launcher (AT)", "O_static_AT_F"],
	["Mini Spike Launcher (AA)", "O_static_AA_F"],
	["Spotting Scope", "ACE_O_SpottingScope"],
	["XM307", "O_GMG_01_F"],
	["XM307 (High)", "O_GMG_01_high_F"],
	["XM307A", "O_GMG_01_A_F"],
	["XM312", "O_HMG_01_F"],
	["XM312 (High)", "O_HMG_01_high_F"],
	["XM312A", "O_HMG_01_A_F"]
];

_usaStatic = [
	"USA",
	["FIM-92F (DMS) (Stinger)", "RHS_Stringer_AA_pod_D"],
	["M2HB (M3 AA)", "RHS_M2StaticMG_D"],
	["M2HB (M3)", "RHS_M2StaticMG_MiniTripod_D"],
	["M41A4 TOW", "RHS_TOW_TriPod_D"],
	["Mk19 (M3)", "RHS_MK19_TriPod_D"]
];

_rusStatic = [
	"Russia",
	["9K115-2 'Metis-M'", "rhs_Metis_9k115_2_msv"],
	["9K115-1 'Kornet-M'", "rhs_Kornet_9M133_2_msv"],
	["9K38 (Djigit)", "rhs_lga_AA_pod_msv"],
	["AGS-30 (6P17)", "RHS_AG30_TriPod_MSV"],
	["KORD (6T7)", "rhs_KORD_MSV"],
	["KORD (6U16)", "rhs_KORD_high_MSV"],
	["NSV (6T7)", "RHS_NSV_TriPod_MSV"],
	["SPG-9M", "rhs_SPG9M_MSV"],
	["ZU-23-2", "RHS_ZU23_MSV"]
];

_return = [_natoStatic, _csatStatic, _usaStatic, _rusStatic];

_return