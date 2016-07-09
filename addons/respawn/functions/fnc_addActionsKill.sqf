/*
  * Author: nikolauska
  *
  * Create ace action menu for killing single unit
  *
  * Argument:
  *
  * Return value:
  * Action children array
  */

#include "script_component.hpp"

private _actions = [];

{
    if (alive _x && {_x getVariable [QEGVAR(respawn,alive), true]}) then {
        _actions pushBack
            [
                [
                    str(_x),
                    _x call EFUNC(common,getName),
                    "",
                    {(_this select 2) call FUNC(killSingle)},
                    {true},
                    {},
                    [_x]
                ] call ace_interact_menu_fnc_createAction,
                [],
                _x
            ];
    };
} forEach (call cba_fnc_players);

_actions
