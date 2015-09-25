/*
  * Author: nikolauska
  *
  * Combines diary texts
  *
  * Argument:
  *
  * Return value:
  *
  */

#include "..\script_component.hpp"

{
    private ["_unit", "_iterator"];
    _vehicle = _x;
    _time = _vehicle getVariable [QGVAR(deadTime), 0];

    if(
        {_x call EFUNC(common,isAlive)} count (crew _vehicle) == 0
    ) then {
        if(
            _time >= GVAR(maxTime) &&
            {{_x distance _vehicle < GVAR(maxDistance)} count (call cba_fnc_players) == 0}
        ) then {
            deleteVehicle _vehicle;
        } else {
            INC(_time);
            _vehicle setVariable [QGVAR(deadTime), _time];
        };
    } else {
        _vehicle setVariable [QGVAR(deadTime), 0];
    };
} forEach vehicles;
