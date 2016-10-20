/*
 * Author: 
 * Nikolauska
 *
 * Description:
 * Stops simulation and opens a textbox with error message.
 *
 * Arguments:
 * 0: Title <STRING>
 * 1: Error message <STRING>
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

params [
  ["_title", "", [""]],
  ["_msg", "", [""]]
];

ERROR_WITH_TITLE(_title,_msg)
