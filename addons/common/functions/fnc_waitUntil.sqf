/*
 * Author: nikolauska
 *
 * Wait and run function after certain criteria is met
 *
 * Argument:
 * 0: Code to execute (Code)
 * 1: Parameters to run the code with (Array)
 * 2: (Number) time till executing or (Code) with boolean return
 *
 * Return value:
 * PFH handler ID
 */

#include "script_component.hpp"

params [
    ["_func", {}, [{}]],
    ["_params", []],
    ["_condition", {true}, [{}, 0]]
];

if(typeName _condition == "CODE") exitWith {
    [_condition, _func, _params] call CBA_fnc_waitUntilAndExecute;
};

if(typeName _condition == "SCALAR") exitWith {
    [_func, _params, _condition] call CBA_fnc_waitAndExecute;
}
