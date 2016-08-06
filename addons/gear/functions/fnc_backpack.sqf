/*
  * Author: nikolauska
  *
  * Creates diary text for backpack
  *
  * Argument:
  *
  * Return value:
  * Diary text
  */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if (!(alive _unit) || !(_unit getVariable [QEGVAR(respawn,alive), true])) exitWith {""};

private _returnText = "";
private _backpack = backpack _unit;

// BACKPACK
if(_backpack != "") then {
   private _image = getText(configFile >> "CfgVehicles" >> _backpack >> "picture") call FUNC(imageCheck);
   private _name = getText(configFile >> "CfgVehicles" >> _backpack >> "displayName");
   _returnText = format ["<img image='%1' width='32' height='32'/><execute expression='systemChat ""Item: %2""'>*</execute>  ", _image, _name];
};

_returnText
