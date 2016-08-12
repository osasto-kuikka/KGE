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
    ["CUP_I_T55_TK_GUE","CUP_Vacannon_D10"],
    ["CUP_I_T34_TK_GUE","CUP_Vacannon_D5_T34"],
    ["CUP_I_T72_RACS","CUP_Vcannon_2A46_Txx"],
    ["CUP_I_T72_NAPA","CUP_Vcannon_2A46_Txx"],
    ["CUP_I_T34_NAPA","UP_Vacannon_D5_T34"],
    ["rhsgref_ins_g_t72bc","rhs_weap_2a46m"],
    ["rhsgref_ins_g_t72bb","rhs_weap_2a46m"],
    ["I_MBT_03_cannon_F","cannon_120mm_long"],
    ["CUP_O_T72_TKA","CUP_Vcannon_2A46_Txx"],
    ["CUP_O_T55_TK","CUP_Vacannon_D10"],
    ["CUP_O_T34_TKA","CUP_Vacannon_D5_T34"],
    ["CUP_O_T72_SLA","CUP_Vcannon_2A46_Txx"],
    ["CUP_O_T72_RU","CUP_Vcannon_2A46_Txx"],
    ["rhs_sprut_vdv","rhs_weap_2a75"],
    ["rhs_t90a_tv","rhs_weap_2a46m_5"],
    ["rhs_t90_tv","rhs_weap_2a46m_4"],
    ["rhs_t80um","rhs_weap_2a46m_4"],
    ["rhs_t80uk","rhs_weap_2a46m_4"],
    ["rhs_t80ue1","rhs_weap_2a46m_4"],
    ["rhs_t80u45m","rhs_weap_2a46m_4"],
    ["rhs_t80u","rhs_weap_2a46m_4"],
    ["rhs_t80bvk","rhs_weap_2a46_2"],
    ["rhs_t80bv","rhs_weap_2a46_2"],
    ["rhs_t80bk","rhs_weap_2a46_2"],
    ["rhs_t80b","rhs_weap_2a46_2"],
    ["rhs_t80a","rhs_weap_2a46m_2"],
    ["rhs_t80","rhs_weap_2a26"],
    ["rhs_t72bd_tv","rhs_weap_2a46m_5"],
    ["rhs_t72bc_tv","rhs_weap_2a46m"],
    ["rhs_t72bb_tv","rhs_weap_2a46m"],
    ["rhs_t72ba_tv","rhs_weap_2a46m"],
    ["CUP_O_T72_TKA_Islam","CUP_Vcannon_2A46_Txx"],
    ["CUP_O_T55_TK_Islam","CUP_Vacannon_D10"],
    ["O_T_MBT_02_cannon_ghex_F","cannon_125mm"],
    ["O_MBT_02_cannon_F","cannon_125mm"],
    ["CUP_O_T72_CSAT","CUP_Vcannon_2A46_Txx"],
    ["CUP_O_T55_CSAT","CUP_Vacannon_D10"],
    ["rhsgref_ins_t72bc","rhs_weap_2a46m"],
    ["rhsgref_ins_t72bb","rhs_weap_2a46m"],
    ["rhsgref_ins_t72ba","rhs_weap_2a46m"],
    ["CUP_O_T72_CHDKZ","CUP_Vcannon_2A46_Txx"],
    ["rhsusf_m1a1hc_wd","rhs_weap_m256"],
    ["rhsusf_m1a1fep_od","rhs_weap_m256"],
    ["rhsusf_m1a1fep_wd","rhs_weap_m256"],
    ["rhsusf_m1a1fep_d","rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskiiwd_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskiwd_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a2sep1wd_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a1aim_tuski_wd","rhs_weap_m256"],
    ["rhsusf_m1a1aimwd_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskiid_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a2sep1tuskid_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a2sep1d_usarmy","rhs_weap_m256"],
    ["rhsusf_m1a1aim_tuski_d","rhs_weap_m256"],
    ["rhsusf_m1a1aimd_usarmy","rhs_weap_m256"],
    ["CUP_B_M1A2_TUSK_MG_USMC","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A2_TUSK_MG_DES_USMC","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A1_Woodland_USMC","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A1_DES_USMC","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A2_TUSK_MG_US_Army","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A2_TUSK_MG_DES_US_Army","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A1_Woodland_US_Army","CUP_Vcannon_M256_M1Abrams"],
    ["CUP_B_M1A1_DES_US_Army","CUP_Vcannon_M256_M1Abrams"],
    ["B_MBT_01_cannon_F","cannon_120mm"],
    ["B_T_MBT_01_TUSK_F","cannon_105mm"],
    ["B_MBT_01_cannon_F","cannon_120mm"],
    ["B_MBT_01_TUSK_F","cannon_105mm"],
    ["CUP_B_T72_CZ","CUP_Vcannon_2A46_Txx"],
    ["CUP_B_T72_CDF","CUP_Vcannon_2A46_Txx"],
    ["BWA3_Leopard2A6M_Tropen","BWA3_L55"],
    ["BWA3_Leopard2A6M_Fleck","BWA3_L55"]
];

ADDON = true;
