/*
 * Author: nikolauska
 *
 * Wait and run function after certain criteria is met
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 * 2: (Number) time till executing or (Code) with boolean return
 * 3: Interval of time in which the execution is evaluated, 0 means every frame (Number)
 *
 * Return value:
 * PFH handler ID
 */

#include "..\script_component.hpp"

params [
    ["_func", {}, [{}]],
    ["_params", []],
    ["_condition", {true}, [{}, 0]],
    ["_interval", 0, [0]]
    ];

if(typeName _condition == "CODE") exitWith {
  [{
          params ["_args", "_pfh"];
          _args params ["_func", "_funcParams", "_condition"];

          // Exit if the time was not reached yet
          if !(call _condition) exitWith {};

          // Destroy PHF
          [_pfh] call CBA_fnc_removePerFrameHandler;

          // Execute the function
          _funcParams call _func;
  }, _interval, [_func, _params, _condition]] call CBA_fnc_addPerFrameHandler;
};

if(typeName _condition == "SCALAR") exitWith {
  [{
          params ["_args", "_pfh"];
          _args params ["_params", "_startTime"];
          _params params ["_func", "_funcParams", "_condition"];

          // Exit if the time was not reached yet
          if (diag_tickTime < _startTime + _condition) exitWith {};

          // Destroy PHF
          [_pfh] call CBA_fnc_removePerFrameHandler;

          // Execute the function
          _funcParams call _func;
  }, _interval, [[_func, _params, _condition], diag_tickTime]] call CBA_fnc_addPerFrameHandler;
}
