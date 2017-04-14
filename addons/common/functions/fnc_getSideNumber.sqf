/*
 * Author: nikolauska
 *
 * Get unit side
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Side
 */

#include "script_component.hpp"

params [["_unit",objNull]];

if (!isNull _unit) then {
  getNumber (configfile >> "cfgvehicles" >> typeof _unit >> "side")
} else {
  -1
}
