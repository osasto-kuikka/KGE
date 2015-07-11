/*
 * Author: nikolauska
 *
 * Starts player animation lock loop wher player can only move head
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

[{
    EXPLODE_2_PVT(_this,_params,_pfh)

    if !((animationState KGE_player) isEqualTo "HubSpectator_stand") then {
        // Switch player animation to lock movement
        KGE_player playMove "HubSpectator_stand";
    };

    if !(GVAR(animationLock)) then {
        // Free player from animation lock
        KGE_player switchMove "AmovPercMstpSlowWrflDnon";

        // Delete this PFH
        [_pfh] call cba_fnc_removePerFrameHandler;
    };
}, 1, []] call cba_fnc_addPerFrameHandler;