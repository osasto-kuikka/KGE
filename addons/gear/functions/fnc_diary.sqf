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

#include "script_component.hpp"

if (!(alive _unit) || !(_unit getVariable [QEGVAR(respawn,alive), true])) exitWith {};

private _group = group KGE_Player;
{
  private _name = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
  if (_x getVariable "displayName" != "") then {
    _name = (_x getVariable "displayName");
  };

  private _diary = format ["<font size='18'>%1 - %2 - %3kg</font><br/>", (_x call EFUNC(common,getName)), _name, round ((loadAbs _x) * 0.1 * 0.45359237 * 10) / 10];

  _diary = _diary + (_x call FUNC(weapons));
  _diary = _diary + (_x call FUNC(magazines));
  _diary = _diary + (_x call FUNC(items));
  _diary = _diary + (_x call FUNC(assignedItems));
  _diary = _diary + (_x call FUNC(backpack));

  private _header = format ["%1 - %2", groupID _group, (_x call EFUNC(common,getName))];
  KGE_Player createDiaryRecord [QGVAR(diarySubject),[_header, _diary]];
} forEach units _group;
