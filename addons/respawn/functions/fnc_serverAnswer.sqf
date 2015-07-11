/*
 * Author: nikolauska
 *
 * Handles server answer
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_status);

switch (_status) do {
    case "respawn": {
        call FUNC(onRespawn);
    };
    case "dead": {
        call FUNC(onKilled);
    };
    default {ERROR(FORMAT_1("invalid status: %1", _status))};
};
