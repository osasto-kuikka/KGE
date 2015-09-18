/*
  * Author: nikolauska
  *
  * Create ace action menu for teleporting single unit to my position
  *
  * Argument:
  *
  * Return value:
  * Action children array
  */

#include "..\script_component.hpp"

private ["_actions"];

_actions = [];

{
    if !(_x call EFUNC(common,isAlive)) then {
        // Stage for removal
        GVAR(respawned) set [_forEachIndex, nil];
    } else {
        if !(local _x) then {
            if(_x getVariable ["KGE_alive", true]) then {
                _actions pushBack
                    [
                        [
                            str(_x),
                            name _x,
                            "",
                            {(_this select 2) call FUNC(teleport)},
                            {true},
                            {},
                            [_x, GVAR(player)]
                        ] call ace_interact_menu_fnc_createAction,
                        [],
                        _x
                    ];
            };
        };
    };
} forEach (call cba_fnc_players);

// Remove nils
GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

_actions
