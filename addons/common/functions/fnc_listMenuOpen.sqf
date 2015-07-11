/*
 * Author: nikolauska
 *
 * Opens list menu
 *
 * Argument:
 * 0: Header text (String)
 * 1: Array of command (Array)
 *    0: Text (String)
 *    1: Command (Code)
 *
 * Return value:
 * Boolean
 */

#define LISTBOX 5133
#define HEADER 5134

#include "script_component.hpp"

EXPLODE_2_PVT(_this,_header,_array);

if (dialog) then { closeDialog 0; };

createDialog "KGE_GUI_Menu";
lbclear LISTBOX;

ctrlShow [LISTBOX, true];
ctrlShow [HEADER, true];
ctrlSetText [HEADER, _header];

{
    EXPLODE_3_PVT(_x,_text,_event,_unit);
    private ["_index"];

    _index = lbAdd [LISTBOX, _text];

    lbSetData [LISTBOX, _index, format["%1",[_event,_unit]]];
} forEach _array;