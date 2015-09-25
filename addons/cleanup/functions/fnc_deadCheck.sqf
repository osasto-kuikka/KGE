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
    _unit = _x;
    _time = _unit getVariable [QGVAR(deadTime), 0];

    if(
        _time >= GVAR(maxTime) &&
        {{_x distance _unit < GVAR(maxDistance)} count (call cba_fnc_players) == 0}
    ) then {
        deleteVehicle _unit;
    } else {
        INC(_time);
        _unit setVariable [QGVAR(deadTime), _time];
    };
} forEach allDead;
