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

if(count GVAR(groupList) == 0 || GVAR(groupIterator) >= count GVAR(groupList)) exitWith {
    GVAR(groupList) = allGroups;
    GVAR(groupIterator) = 0;
};

private ["_grp", "_delete"];
_grp = GVAR(groupList) select GVAR(groupIterator);
_delete = true;

if(
    {_x call EFUNC(common,isAlive)} count (units _grp) == 0
) then {
    _delete = false;
};

if(_delete) then {
    deleteGroup _grp;
};

INC(GVAR(groupIterator));
