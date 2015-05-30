/*
 * Author: nikolauska
 *
 * Executes a code once with a given game time delay, using a PFH
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 * 2: Delay in seconds before executing the code (Number)
 * 3: Interval of time in which the execution is evaluated, 0 means every frame (Number)
 *
 * Return value:
 * PFH handler ID
 */

#include "script_component.hpp"

_interval = _this select 3;
[
    {
        EXPLODE_2_PVT(_this, _args, _pfh);
        EXPLODE_2_PVT(_args, _params, _startTime);
        EXPLODE_3_PVT(_params, _func, _funcParams, _delay);

        // Exit if the time was not reached yet
        if (time < _startTime + _delay) exitWith {};

        // Destroy PHF
        [_pfh] call CBA_fnc_removePerFrameHandler;

        // Execute the function
        _funcParams call _func;
    },
    _interval,
    [_this, time]
] call CBA_fnc_addPerFrameHandler