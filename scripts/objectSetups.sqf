[drr5_c, "drr5", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[drr5_t, "drr5"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[drr5_sb, drr5_t] remoteExec ["wsot_fnc_registerScoreboard", 2, false];

[drr3_c, "drr3", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[drr3_t, "drr3"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[drr3_sb, drr3_t] remoteExec ["wsot_fnc_registerScoreboard", 2, false];

[drr2_c, "drr2", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[drr2_t, "drr2"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[drr2_sb, drr2_t] remoteExec ["wsot_fnc_registerScoreboard", 2, false];

[tfa_t, "tfa"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[tfa_c_1, "tfa", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[tfa_c_2, "tfa", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[tfa_c_3, "tfa", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[tfa_c_4, "tfa", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[tfa_c_5, "tfa", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[tfa_c_6, "tfa", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[tfa_sb, tfa_t] remoteExec ["wsot_fnc_registerScoreboard", 2, false];

[ra1_t, "ra1"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[ra1_c_1, "ra1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[ra1_c_2, "ra1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[ra1_sb, ra1_t] remoteExec ["wsot_fnc_registerScoreboard", 2, false];

[ra3_t, "ra3"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[ra3_c_1, "ra3", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[ra3_c_2, "ra3", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[ra3_sb, ra3_t] remoteExec ["wsot_fnc_registerScoreboard", 2, false];

[ra4_t, "ra4"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[ra4_c_1, "ra4", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[ra4_c_2, "ra4", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];

[rc1_t, "rc1"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[rc1_c_1, "rc1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rc1_c_2, "rc1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rc1_c_3, "rc1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rc1_c_4, "rc1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];

[asr_c, "asr", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[asr_t, "asr"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];

[rb2_c_1, "rb2", true] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
[rb2_c_2, "rb2", true] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
[rb2_c_3, "rb2", true] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
[rb2_c_4, "rb2", true] remoteExec ["wsot_fnc_rangeControllerSetup", 2, false];
[rb2_t, "rb2"] remoteExec ["wsot_fnc_rangeTriggerSetup", 2, false];
[[rb2_db_1, rb2_db_2, rb2_db_3, rb2_db_4], rb2_t] remoteExec ["wsot_fnc_registerDamageBoards", 2, false];

[objective_t_alpha, "objective_alpha"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_bravo, "objective_bravo"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_charlie, "objective_charlie"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_delta, "objective_delta"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_echo, "objective_echo"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_foxtrot, "objective_foxtrot"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_golf, "objective_golf"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[objective_t_hotel, "objective_hotel"] remoteExec ["wsot_fnc_objectiveTriggerSetup", 2, false];
[brief_i_alpha, "objective_alpha", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_bravo, "objective_bravo", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_charlie, "objective_charlie", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_delta, "objective_delta", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_echo, "objective_echo", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_foxtrot, "objective_foxtrot", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_golf, "objective_golf", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];
[brief_i_hotel, "objective_hotel", true] remoteExec ["wsot_fnc_objectiveInstructor", 2, false];

[hg_request_1, "hg1", true] remoteExec ["wsot_fnc_staticController", 2, false];
[hg_request_2, "hg2", true] remoteExec ["wsot_fnc_staticController", 2, false];
[hg_request_3, "hg3", true] remoteExec ["wsot_fnc_staticController", 2, false];
[hg_request_4, "hg4", true] remoteExec ["wsot_fnc_staticController", 2, false];
[hg_request_5, "hg5", true] remoteExec ["wsot_fnc_staticController", 2, false];
[hg_request_6, "hg6", true] remoteExec ["wsot_fnc_staticController", 2, false];
[hg_placement_1, "hg1", true] remoteExec ["wsot_fnc_registerStaticPlacement", 2, false];
[hg_placement_2, "hg2", true] remoteExec ["wsot_fnc_registerStaticPlacement", 2, false];
[hg_placement_3, "hg3", true] remoteExec ["wsot_fnc_registerStaticPlacement", 2, false];
[hg_placement_4, "hg4", true] remoteExec ["wsot_fnc_registerStaticPlacement", 2, false];
[hg_placement_5, "hg5", true] remoteExec ["wsot_fnc_registerStaticPlacement", 2, false];
[hg_placement_6, "hg6", true] remoteExec ["wsot_fnc_registerStaticPlacement", 2, false];

[rb1_c_1, "rb1_1", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_2, "rb1_2", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_3, "rb1_2", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_4, "rb1_3", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_5, "rb1_3", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_6, "rb1_5", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_7, "rb1_5", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_8, "rb1_6", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_9, "rb1_6", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_10, "rb1_4", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_c_11, "rb1_4", true] remoteExec ["wsot_fnc_areaControllerSetup", 2, false];
[rb1_t_1, "rb1_1"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[rb1_t_2, "rb1_2"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[rb1_t_3, "rb1_3"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[rb1_t_4, "rb1_4"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[rb1_t_5, "rb1_5"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];
[rb1_t_6, "rb1_6"] remoteExec ["wsot_fnc_targetTriggerSetup", 2, false];

[vr_c_1, "vr1", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_2, "vr2", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_3, "vr3", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_4, "vr4", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_5, "vr5", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_6, "vr6", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_7, "vr7", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_8, "vr8", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_9, "vr9", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_10, "vr10", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_11, "vr11", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_12, "vr12", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_13, "vr13", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_14, "vr14", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_15, "vr15", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_c_16, "vr16", true] remoteExec ["wsot_fnc_vehicleController", 2, false];
[vr_t_1, "vr1"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_2, "vr2"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_3, "vr3"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_4, "vr4"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_5, "vr5"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_6, "vr6"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_7, "vr7"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_8, "vr8"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_9, "vr9"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_10, "vr10"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_11, "vr11"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_12, "vr12"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_13, "vr13"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_14, "vr14"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_15, "vr15"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];
[vr_t_16, "vr16"] remoteExec ["wsot_fnc_vehicleTriggerSetup", 2, false];