#include "script_component.hpp"

GVAR(fixerPair) = [
    // Fix radios that don't have id's removed
    ["tf_anprc152_1", "tf_anprc152"],
    ["tf_anprc152g_1", "tf_anprc152g"],
    ["tf_rt1523g_1", "tf_rt1523g"],
    ["tf_rt1523g_big_rhs_1", "tf_rt1523g_big_rhs"],
    ["tf_rt1523g_rhs_1", "tf_rt1523g_rhs"],
    ["tf_rt1523g_black_1", "tf_rt1523g_black"]
];
GVAR(fixerHash) = [GVAR(fixerPair), ""] call cba_fnc_hashCreate;

"postInit" call FUNC(applyLoadout);
