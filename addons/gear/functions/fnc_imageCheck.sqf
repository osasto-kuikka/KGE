/*
  * Author: nikolauska
  *
  * Fixes image text incase it's missing file type
  *
  * Argument:
  *
  * Return value:
  * Image text
  */

#include "script_component.hpp"

params ["_image"];

if((_image find ".paa") == -1) then {
    _image = format["%1.paa", _image];
};

_image
