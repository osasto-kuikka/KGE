/*
 * Author: nikolauska
 *
 * Reads module settings and returns it
 *
 * Arguments:
 * 0: Module (Object)
 * 1: Module parameter name (string)
 *
 * Return Value:
 * Variable form module
 */
#include "..\script_component.hpp"

if !(isServer) exitWith {};

params [
  ["_logic", objNull],
  ["_moduleVariable", ""]
];

if(isNull _logic || _moduleVariable isEqualTo "") exitWith {
    ERROR("Invalid parameters for module object or variable text");
};

// Check if the parameter is defined in the module
if (isNil {_logic getVariable _moduleVariable}) exitWith {
    ERROR(FORMAT_2("Warning in %1 module: %2 setting is missing. Propably obsolete version of module in use on mission.",typeOf _logic,_moduleVariable));
};

_logic getVariable _moduleVariable
