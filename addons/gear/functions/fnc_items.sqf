/*
  * Author: nikolauska
  *
  * Creates diary text for items
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

// Get all magazines and remove dublicates
private _itemsAll = items _unit;
private _itemsSingle = _itemsAll arrayIntersect _itemsAll;

// Add magazine amount
private _items = [];
{
    private _item = _x;
    _items pushBack [_item, ({_x == _item} count _itemsAll)];
} forEach _itemsSingle;

// Add magazine images and text
{
    _x params ["_item", "_count"];

    private _conf = configFile >> "CfgWeapons" >> _item;
    private _image = getText(_conf >> "picture") call FUNC(imageCheck);
    private _name = getText(_conf >> "displayName");
    _returnText = _returnText + format ["<img image='%2' width='32' height='32'/><execute expression='systemChat ""Item: %3""'>x%1</execute>, ", _count, _image, _name];

    INC(GVAR(addedItems));

    if((GVAR(addedItems) mod 6) == 0) then { _returnText = _returnText + "<br/>" };
} forEach _items;

_returnText
