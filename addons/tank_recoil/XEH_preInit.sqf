#include "script_component.hpp"

ADDON = false;

PREP(addEvent);
PREP(addRecoil);
PREP(addSmoke);
PREP(firedEvent);
PREP(removeEvent);

GVAR(debug) = false;
GVAR(allowedTanks) = [];
GVAR(tankNamespace) = call cba_fnc_createNameSpace;
GVAR(tankDefines) = [
    // RHS
    ["rhs_sprut_vdv", "rhs_weap_2a75"],
    ["rhsusf_m1a1fep_d", "rhs_weap_m256"],
    ["rhsusf_m1a1fep_wd", "rhs_weap_m256"],
    ["rhsusf_m1a1fep_od", "rhs_weap_m256"],
    ["rhsusf_m1a1aimd_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a1aimwd_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a1aim_tuski_d", "rhs_weap_m256"],
    ["rhsusf_m1a2sep1d_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a1aim_tuski_wd", "rhs_weap_m256"],
    ["rhsusf_m1a2sep1wd_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskid_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskiwd_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskiid_usarmy", "rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskiiwd_usarmy", "rhs_weap_m256"],
    ["rhs_t72ba_tv", "rhs_weap_2a46m"],
    ["rhs_t72bb_chdkz", "rhs_weap_2a46m"],
    ["rhs_t72bb_tv", "rhs_weap_2a46m"],
    ["rhs_t72bc_tv", "rhs_weap_2a46m"],
    ["rhs_t72bd_tv", "rhs_weap_2a46m_5"],
    ["rhs_t72bb_chdkz", "rhs_weap_2a46m"],
    ["rhs_t80", "rhs_weap_2a46m"],
    ["rhs_t80a", "rhs_weap_2a46_2"],
    ["rhs_t80b", "rhs_weap_2a46_2"],
    ["rhs_t80bk", "rhs_weap_2a46_2"],
    ["rhs_t80bv", "rhs_weap_2a46_2"],
    ["rhs_t80bvk", "rhs_weap_2a46_2"],
    ["rhs_t80u", "rhs_weap_2a46m_4"],
    ["rhs_t80um", "rhs_weap_2a46m_4"],
    ["rhs_t80u45m", "rhs_weap_2a46m_4"],
    ["rhs_t80ue1", "rhs_weap_2a46m_4"],
    ["rhs_t80uk", "rhs_weap_2a46m_4"],
    ["rhs_t90a_tv", "rhs_weap_2a46m_4"],
    ["rhs_t90_tv", "rhs_weap_2a46m_4"],
    ["rhs_2s3_tv", "RHS_Weap_2a33"],
    ["rhsusf_m109d_usarmy", "rhs_weap_m284"],
    ["rhsusf_m109_usarmy", "rhs_weap_m284"],

    // Vanilla
    ["O_MBT_02_cannon_F", "cannon_125mm"],
    ["B_MBT_01_cannon_F", "cannon_120mm"],
    ["B_MBT_01_TUSK_F", "cannon_105mm"],
    ["I_MBT_03_cannon_F", "cannon_120mm_long"],
    ["O_MBT_02_arty_F", "mortar_155mm_AMOS"],
    ["B_MBT_01_arty_F", "mortar_155mm_AMOS"],

    // Burnes
    ["Burnes_M1A1_MEU_02_Public", "MEU_125_MAINGUN"],
    ["Burnes_M1A1_MEU_01_Public", "MEU_125_MAINGUN"],

    // LOP
    ["LOP_US_T72BB", "rhs_weap_2a46m"],
    ["LOP_US_T72BA", "rhs_weap_2a46m"],
    ["LOP_AM_T72BA", "rhs_weap_2a46m"],
    ["LOP_AFR_T72BA", "rhs_weap_2a46m"],
    ["LOP_ChDKZ_T72BB", "rhs_weap_2a46m"],
    ["LOP_ChDKZ_T72BA", "rhs_weap_2a46m"],
    ["LOP_ISTS_T72BA", "rhs_weap_2a46m"],
    ["LOP_RACS_T72BA", "rhs_weap_2a46m"],
    ["LOP_TKA_T72BA", "rhs_weap_2a46m"],
    ["LOP_TKA_T72B", "rhs_weap_2a46m"]
];

ADDON = true;
