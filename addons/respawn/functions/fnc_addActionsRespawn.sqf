/*
  * Author: nikolauska
  *
  * Create ace action menu for respawning single unit
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
    if(_x call EFUNC(common,isAlive) && {!(_x getVariable ["KGE_alive", true])}) then {
        _actions pushBack
            [
                [
                    str(_x),
                    _x call EFUNC(common,getName),
                    "",
                    {(_this select 2) call FUNC(respawnSingle)},
                    {true},
                    {},
                    [_x, "KGE_RESPAWN"]
                ] call ace_interact_menu_fnc_createAction,
                [],
                _x
            ];
    };
} forEach (call cba_fnc_players);

_actions
