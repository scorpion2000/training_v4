/*	The arrays should contain all vehicles we wish to use	*/
/*	NOTE: FIRST ELEMENT MUST BE THE CLASS NAME, REST FORMAT = ["DISPLAY NAME", "CLASSNAME"]	*/
/*	SIDENOTE: CLASSNAMES ARE CASE SENSITIVE	*/

_car = [
	["car", "Cars"],
	["HMMWV", "rhsusf_m1025_d"],
	["HMMWV (M2)", "rhsusf_m1025_d_m2"],
	["HMMWV (Mk19)", "rhsusf_m1025_d_Mk19"],
	["HMMWV (TOW)", "rhsusf_m966_d"]
];

_truck = [
	["truck", "Trucks"],
	["MTV", "rhsusf_M1078A1P2_D_fmtv_usarmy"],
	["MTV (Flatbed)", "rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy"],
	["HEMTT", "rhsusf_M977A4_usarmy_d"],
	["HEMTT (Ammo)", "rhsusf_M977A4_AMMO_usarmy_d"],
	["HEMTT (Repair)", "rhsusf_M977A4_REPAIR_usarmy_d"],
	["HEMTT (Fuel)", "rhsusf_M978A4_usarmy_d"]
];

_mrap = [
	["mrap", "MRAPs"],
	["Guardian", "rhsusf_m1117_d"],
	["Caiman", "rhsusf_M1220_usarmy_d"],
	["Caiman (CROWS/M2)", "rhsusf_M1220_M153_M2_usarmy_d"],
	["Caiman (CROWS/Mk19)", "rhsusf_M1220_M153_MK19_usarmy_d"],
	["Caiman (M2)", "rhsusf_M1220_M2_usarmy_d"],
	["Caiman (Mk19)", "rhsusf_M1220_MK19_usarmy_d"],
	["Caiman (MEDEVAC)", "rhsusf_M1230a1_usarmy_d"],
	["RG-33", "rhsusf_M1232_usarmy_d"],
	["RG-33 (M2)", "rhsusf_M1232_M2_usarmy_d"],
	["RG-33 (Mk19)", "rhsusf_M1232_MK19_usarmy_d"],
	["Oshkosh", "rhsusf_m1240a1_usarmy_d"],
	["Oshkosh (M2)", "rhsusf_m1240a1_m2_usarmy_d"],
	["Oshkosh (Mk19)", "rhsusf_m1240a1_mk19_usarmy_d"],
	["Oshkosh (M240)", "rhsusf_m1240a1_m240_usarmy_d"],
	["Oshkosh (CROWS/M2)", "rhsusf_m1240a1_m2crows_usarmy_d"],
	["Oshkosh (CROWS/Mk19)", "rhsusf_m1240a1_mk19crows_usarmy_d"]
];

_apc = [
	["apc", "APCs"],
	["Stryker (M2)", "rhsusf_stryker_m1126_m2_d"],
	["Stryker (Mk19)", "rhsusf_stryker_m1126_mk19_d"],
	["Stryker (M2/LRAS3)", "rhsusf_stryker_m1127_m2_d"],
	["Stryker (SMP/M2)", "rhsusf_stryker_m1132_m2_d"],
	["Stryker", "rhsusf_stryker_m1134_d"],
	["M113A3", "rhsusf_m113d_usarmy_unarmed"],
	["M113A3 (Ammo)", "rhsusf_m113d_usarmy_supply"],
	["M113A3 (M2)", "rhsusf_m113d_usarmy"],
	["M113A3 (M240)", "rhsusf_m113d_usarmy_M240"],
	["M113A3 (MEV)", "rhsusf_m113d_usarmy_medical"]
];

_ifv = [
	["ifv", "IFVs"],
	["M2A2 Bradley", "RHS_M2A2"],
	["M2A2 Bradley (BUSK I)", "RHS_M2A2_BUSKI"],
	["M2A3 Bradley", "RHS_M2A3"],
	["M2A3 Bradley (BUSK I)", "RHS_M2A3_BUSKI"],
	["M2A3 Bradley (BUSK III)", "RHS_M2A3_BUSKIII"],
	["M6A2 Bradley Stinger", "RHS_M6"]
];

_antiAir = [
	["antiAir", "Mobile Anti-Air"]
	//["Quad Bike", "B_Quadbike_01_F"]
];

_artillery = [
	["artillery", "Mobile Artillery"],
	["Howitzer", "rhsusf_m109d_usarmy"]
];

_tank = [
	["tank", "Tanks"],
	["M1A1 Abrams", "rhsusf_m1a1aimd_usarmy"],
	["M1A1 Abrams (TUSK I)", "rhsusf_m1a1aim_tuski_d"],
	["M1A2 Abrams", "rhsusf_m1a2sep1d_usarmy"],
	["M1A2 Abrams (TUSK I)", "rhsusf_m1a2sep1tuskid_usarmy"],
	["M1A2 Abrams (TUSK II)", "rhsusf_m1a2sep1tuskiid_usarmy"],
	["M1A2 Abrams / SEP v2", "rhsusf_m1a2sep2d_usarmy"]
];

_return = [_car, _truck, _mrap, _apc, _ifv, _antiAir, _artillery, _tank];

_return