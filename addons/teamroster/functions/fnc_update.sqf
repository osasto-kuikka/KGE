/*
 * Author: nikolauska
 *
 * Updates teamroster text
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

private _teamrosterText = "";

// Loop through all players and add them to teamroster text

{
  _x params ["_group"];
  if(side _group == side (group KGE_Player) && {isPlayer _x} count (units _group) != 0) then {
    _teamrosterText = format["%1 %2", _teamrosterText, ([leader _group] call FUNC(getPlayerEntry))];
    {
      _x params ["_unit"];
      _teamrosterText = format["%1 %2", _teamrosterText, ([_unit] call FUNC(getPlayerEntry))];
    } forEach (units _group) - [leader _group];
  };
} forEach allGroups;

private _title = format["%1 - %2", side (group KGE_Player), GVAR(iteration)];

// Add diary text
KGE_Player createDiaryRecord [QGVAR(diarySubject), [_title, _teamrosterText]];

// Increase iteration number
INC(GVAR(iteration));
