/*
 * Author: nikolauska
 *
 * Sanitizes string to only show alphabetical letters
 *
 * Arguments:
 * 0: Source string (String)
 *
 * Return Value:
 * Sanitized string
 */

#include "..\script_component.hpp"

params [["_text", ""]];

_text = toArray _text;
private _arrayNew = [];

{
    // uppercase and lowercase letter according to unicode characters
    // https://en.wikipedia.org/wiki/List_of_Unicode_characters
    if(_x > 34 && _x < 59 || _x >= 66 && _x < 91) then {
        PUSH(_arrayNew,_x);
    };
} forEach _array;

toString _arrayNew
