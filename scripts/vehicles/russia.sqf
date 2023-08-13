/*	The arrays should contain all vehicles we wish to use	*/
/*	NOTE: FIRST ELEMENT MUST BE THE CLASS NAME, REST FORMAT = ["DISPLAY NAME", "CLASSNAME"]	*/
/*	SIDENOTE: CLASSNAMES ARE CASE SENSITIVE	*/

_car = [
	["car", "Cars"],
	["GAZ", "rhs_tigr_msv"],
	["GAZ (Weapons)", "rhs_tigr_sts_msv"],
	["GAZ (Open Top)", "rhs_tigr_m_msv"],
	["UAZ", "RHS_UAZ_MSV_01"],
	["UAZ (Open)", "rhs_uaz_open_MSV_01"]
];

_truck = [
	["truck", "Trucks"],
	["GAZ-66", "rhs_gaz66_msv"],
	["GAZ-66 (Ammo)", "rhs_gaz66_ammo_msv"],
	["GAZ-66 (Flatbed)", "rhs_gaz66o_msv"],
	["GAZ-66 (Open/Flatbed)", "rhs_gaz66o_flat_msv"],
	["GAZ-66 (Open/Flatbed)", "rhs_gaz66o_flat_msv"],
	["KamAZ", "rhs_kamaz5350_msv"],
	["KamAZ (Ammo)", "rhs_kamaz5350_ammo_msv"],
	["KamAZ (Flatbed)", "rhs_kamaz5350_flatbed_cover_msv"],
	["KamAZ (Open)", "rhs_kamaz5350_open_msv"],
	["KamAZ (Open/Flatbed)", "rhs_kamaz5350_flatbed_msv"],
	["KrAZ (BMK-T)", "rhs_kraz255b1_bmkt_msv"],
	["KrAZ (Flatbed)", "rhs_kraz255b1_flatbed_msv"],
	["KrAZ (BMK-T)", "rhs_kraz255b1_cargo_open_msv"],
	["KrAZ (PMP)", "rhs_kraz255b1_pmp_msv"],
	["KrAZ (Fuel)", "rhs_kraz255b1_fuel_msv"],
	["Ural", "RHS_Ural_MSV_01"],
	["Ural (Ammo)", "RHS_Ural_Ammo_MSV_01"],
	["Ural (Flatbed)", "RHS_Ural_Flat_MSV_01"],
	["Ural (Fuel)", "RHS_Ural_Fuel_MSV_01"],
	["Ural (ZSU-23)", "RHS_Ural_Zsu23_MSV_01"],
	["ZiL", "rhs_zil131_msv"],
	["ZiL (Flatbed)", "rhs_zil131_flatbed_msv"],
	["ZiL (Open)", "rhs_zil131_open_msv"],
	["ZiL (Open/Flatbed)", "rhs_zil131_flatbed_msv"]
];

_mrap = [
	["mrap", "MRAPs"],
	["BRDM-2", "rhsgref_BRDM2_msv"],
	["BRDM-2 (9P148)", "rhsgref_BRDM2_ATGM_msv"],
	["BRDM-2UM", "rhsgref_BRDM2UM_msv"],
	["BRDM-2UM (Armed)", "rhsgref_BRDM2UM_HQ_msv"]
];

_apc = [
	["apc", "APCs"],
	["BTR-60PB", "rhs_btr60_msv"],
	["BTR-70", "rhs_btr70_msv"],
	["BTR-80", "rhs_btr80a_msv"],
	["BTR-80A", "rhs_btr80_msv"]
];

_ifv = [
	["ifv", "IFVs"],
	["BMP-1", "rhs_bmp1_msv"],
	["BPM-2 (obr. 1986g.)", "rhs_bmp2_msv"],
	["BPM-3 (early)", "rhs_bmp3_msv"],
	["BPM-3 (late)", "rhs_bmp3_late_msv"],
	["BRM-1K", "rhs_brm1k_msv"],
	["BDM-1", "rhs_bdm1"],
	["BDM-2", "rhs_bdm2"],
	["BDM-4", "rhs_bdm4_vdv"]
];

_antiAir = [
	["antiAir", "Mobile Anti-Air"],
	["ZSU-24-4V", "rhs_zsu234_aa"]
];

_artillery = [
	["artillery", "Mobile Artillery"],
	["BM-21 Grad", "RHS_BM21_MSV_01"]
];

_tank = [
	["tank", "Tanks"],
	["T-72B (obr. 1984g.)", "rhs_t72ba_tv"],
	["T-72B (obr. 1989g.)", "rhs_t72bc_tv"],
	["T-72B (obr. 2016g.)", "rhs_t72be_tv"],
	["T-80", "rhs_t80"],
	["T-80A", "rhs_t80a"],
	["T-80B", "rhs_t80b"],
	["T-80U", "rhs_t80u"],
	["T-80UK", "rhs_t80uk"],
	["T-80UM", "rhs_t80um"],
	["T-90 (obr. 1992g.)", "rhs_t90_tv"],
	["T-90A (obr. 2006g.)", "rhs_t90a_tv"],
	["T-90AM (obyekt 188AM)", "rhs_t90am_tv"],
	["T-90SA (obr. 2004g.)", "rhs_t90saa_tv"],
	["T-90SA (obr. 2016g.)", "rhs_t90sab_tv"],
	["T-90SM (obyekt 188SM)", "rhs_t90sm_tv"]
];

_return = [_car, _truck, _mrap, _apc, _ifv, _antiAir, _artillery, _tank];

_return