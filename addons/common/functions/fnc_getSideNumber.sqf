/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Get unit side
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Side number <NUMBER>
 */

#include "script_component.hpp"

params [["_unit",objNull]];

if (!isNull _unit) then {
  getNumber (configfile >> "cfgvehicles" >> typeof _unit >> "side")
} else {
  -1
}
