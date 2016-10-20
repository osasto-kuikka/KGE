/*
 * Author:
 * Nikolauska
 *
 * Description
 * Applies given code to every element in an array
 *
 * Arguments:
 * 0: Array to be changed <ARRAY>
 * 1: Code to be applied to every element <CODE>
 *
 * Return Value:
 * Final array <ARRAY>
 */

#include "script_component.hpp"

params [
  ["_array", [], [[]]],
  ["_code", {true}, [{}]
];

KGE_DEPRECATED(QFUNC(map),"1.2.0","ARRAY apply CODE");

_array apply _code;
