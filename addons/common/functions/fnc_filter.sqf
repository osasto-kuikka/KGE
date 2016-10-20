/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Filters array and removes every element not fitting the condition
 *
 * Arguments:
 * 0: Array to be filtered <ARRAY>
 * 1: Code to be evaluated <CODE>
 *
 * Return Value:
 * Filtered array <ARRAY>
 */

#include "script_component.hpp"

params ["_array", "_code"];

KGE_DEPRECATED(QFUNC(filter),"1.2.0","select CODE")

_array select _code;
