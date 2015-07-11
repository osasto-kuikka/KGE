/*
 * Author:
 * Nikolauska
 *
 * Handles list menu clicked event
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Object
 */

#define LISTBOX 5133

#include "script_component.hpp"

private ["_data"];
_data = call compile lbData [LISTBOX, lbCurSel LISTBOX];

EXPLODE_2_PVT(_data,_event,_unit);

[_event, [_unit]] call CFUNC(whereLocalEvent);
