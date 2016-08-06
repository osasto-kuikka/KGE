/*
  * Author: nikolauska
  *
  * Creates diary text for magazines
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

private _returnText = format ["<font color='#FFFF00'>Magazines and items: </font>(Click count for info.)<br/>", _unit];

// Get all magazines and remove dublicates
private _magazinesAll = magazines _unit;
private _magazinesSingle = _magazinesAll arrayIntersect _magazinesAll;

// Add magazine amount
private _magazines = [];
{
    private _magazine = _x;
    _magazines pushBack [_magazine, ({_x == _magazine} count _magazinesAll)];
} forEach _magazinesSingle;

// Add magazine images and text
{
    _x params ["_magazine", "_count"];

    private _conf = configFile >> "CfgMagazines" >> _magazine;
    private _image = getText(_conf >> "picture") call FUNC(imageCheck);
    private _name = getText(_conf >> "displayName");
    _returnText = _returnText + format ["<img image='%2' width='32' height='32'/><execute expression='systemChat ""Item: %3""'>x%1</execute>, ", _count, _image, _name];

    INC(GVAR(addedItems));

    if((GVAR(addedItems) mod 6) == 0) then { _returnText = _returnText + "<br/>" };
} forEach _magazines;

_returnText
