/*
 * Author: nikolauska
 *
 * Teleport unit behind target unit
 *
 * Argument:
 * 0: Unit to be teleported <Object>
 * 1: Unit to teleport to <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

#define MINDISTANCE 2
#define MAXDISTANCE 10

params ["_unit", "_target"];
private ["_targetPos", "_targetDir", "_isFlat"];

_targetPos = (position _target) findEmptyPosition [MINDISTANCE, MAXDISTANCE, (typeof _target)];

if(count _targetPos == 0) exitWith {
    GVAR(target) = _target;
    [{
        params ["_unit", "_target"];

        [_unit, _target] call FUNC(toBehind);

    },[_unit, _target],
    {count ((position GVAR(target)) findEmptyPosition [MINDISTANCE, MAXDISTANCE, (typeof GVAR(target))]) != 0}, 1] call EFUNC(common,waitUntil);

    hint "No space nearby! Get to more open area for teleport!";
};

_unit setPos _targetPos;

// Find teleported object and remove it from respawned array
_respawnedIndex = GVAR(respawned) find _unit;
if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

[QGVAR(onTeleport), _target, []] call AFUNC(common,targetEvent);
