/*
  * Author: nikolauska
  *
  * Combines diary texts
  *
  * Argument:
  *
  * Return value:
  *
  */

#include "..\script_component.hpp"

params [["_unit", KGE_Player, [objNull]]];
private ["_group", "_header"];

if !(_unit call EFUNC(common,isAlive)) exitWith {"asd"};

_group = group _unit;
{
    private ["_name"];

    _name = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
    if (_x getVariable "displayName" != "") then {
       _name = (_x getVariable "displayName");
    };

    _diary = format ["<font size='18'>%1 - %2 - %3kg</font><br/>", (_x call EFUNC(common,getName)), _name, round ((loadAbs _x) * 0.1 * 0.45359237 * 10) / 10];

    _diary = _diary + (_x call FUNC(weapons));
    _diary = _diary + (_x call FUNC(magazines));
    _diary = _diary + (_x call FUNC(items));
    _diary = _diary + (_x call FUNC(assignedItems));
    _diary = _diary + (_x call FUNC(backpack));

    _header = format ["%1 - %2", groupID _group, (_x call EFUNC(common,getName))];
    _unit createDiaryRecord [QGVAR(diarySubject),[_header, _diary]];
} forEach units _group;

INC(GVAR(iteration));
