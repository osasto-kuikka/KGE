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
_interval = _this select 3;
[
    {
        _args = _this select 0;
        _func = (_args select 0) select 0;
        _funcParams = (_args select 0) select 1;
        _delay = (_args select 0) select 2;
        _startTime = _args select 1;

        // Exit if the time was not reached yet
        if (time < _startTime + _delay) exitWith {};

        // Destroy PHF
        [_this select 1] call CBA_fnc_removePerFrameHandler;

        // Execute the function
        _funcParams call _func;
    },
    _interval,
    [_this, time]
] call CBA_fnc_addPerFrameHandler