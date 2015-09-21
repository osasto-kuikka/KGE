/*
  * Author: nikolauska
  *
  * Creates diary text for weapons
  *
  * Argument:
  *
  * Return value:
  * Diary text
  */

#include "..\script_component.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if(isNull _unit) exitWith {"null"};

private ["_returnText", "_sweaponName", "_hweaponName", "_weaponName"];
_returnText = "";
_sweaponName = secondaryWeapon _unit;
_hweaponName = handgunWeapon _unit;
_weaponName = primaryWeapon _unit;

// Main weapon
if(_weaponName != "") then {
    private ["_conf", "_name", "_image"];

    _conf = configFile >> "CfgWeapons" >> _weaponName;
    _name = getText(_conf >> "displayName");
    _image = getText(_conf >> "picture") call FUNC(imageCheck);
    _returnText = _returnText + format ["<font color='#FFFF00'>Primary: </font>%1<br/><img image='%2' width='100' height='50'/>", _name, _image];

    {
        if(_x != "") then {
            _image = getText(configFile >> "CfgWeapons" >> _x >> "picture") call FUNC(imageCheck);
            _returnText = _returnText + format ["<img image='%1' width='50' height='50'/>", _image];
        };
    } forEach (primaryWeaponItems _unit);

    _returnText = _returnText + "<br/>";
};

// Handgun
if(_hweaponName != "") then {
    private ["_name", "_image"];

    _name = getText(configFile >> "CfgWeapons" >> _hweaponName >> "displayName");
    _returnText = _returnText + format ["<font color='#FFFF00'>Sidearm: </font>%1<br/>", _name];

    _image = getText(configFile >> "CfgWeapons" >> _hweaponName >> "picture") call FUNC(imageCheck);
    _returnText = _returnText + format ["<img image='%1' width='50' height='50'/>", _image];

    {
        if(_x != "") then {
            _image = getText(configFile >> "CfgWeapons" >> _x >> "picture") call FUNC(imageCheck);
            _returnText = _returnText + format ["<img image='%1' width='50' height='50'/>", _image];
        };
    } forEach (handgunItems _unit);

    _returnText = _returnText + "<br/>";
};

// Sidearm
if(_sweaponName != "") then {
    private ["_name", "_image"];

    _name = getText(configFile >> "CfgWeapons" >> _sweaponName >> "displayName");
    _returnText = _returnText + format ["<font color='#FFFF00'>Launcher: </font>%1  <br/>", _name];

    _image = getText(configFile >> "CfgWeapons" >> _sweaponName >> "picture") call FUNC(imageCheck);
    _returnText = _returnText + format ["<img image='%1' width='100' height='50'/>", _image];

    _items = secondaryWeaponItems _unit;
    {
        if(_x != "") then {
            _image = getText(configFile >> "CfgWeapons" >> _x >> "picture") call FUNC(imageCheck);
            _returnText = _returnText + format ["<img image='%1' width='50' height='50'/>", _image];
        };

    } forEach (secondaryWeaponItems _unit);

    _returnText = _returnText + "<br/>";
};

_returnText
