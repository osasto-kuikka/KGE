/*
 * Author: nikolauska
 *
 * Get array of all dead players
 *
 * Argument:
 *
 * Return value:
 * Array
 */

#include "script_component.hpp"

private ["_header", "_array"];
_header = localize LSTRING(menu_header_single);
_array = [];

if(_this == "respawn") exitWith {
    {
        private ["_name"];
        _name = _x call EFUNC(common,getName);

        PUSH(_array,[ARR_3(_name,QGVAR(returnAliveEvent),_x)]);
    } forEach (call FUNC(getDeadPlayers));

    [_header, _array] call EFUNC(common,listMenuOpen);
};

if(_this == "kill") exitWith {
    {
        private ["_name"];
        _name = _x call EFUNC(common,getName);

        PUSH(_array,[ARR_3(_name,QGVAR(killEvent),_x)]);
    } forEach (call FUNC(getAlivePlayers));

    [_header, _array] call EFUNC(common,listMenuOpen);
};

ERROR(FORMAT_1("Invalid type %1",_type));
