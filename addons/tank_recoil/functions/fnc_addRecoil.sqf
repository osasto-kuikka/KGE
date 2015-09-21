/*
 * Author: nikolauska
 *
 * Adds recoil for tank
 *
 * Argument:
 * 0: Object
 *
 * Return value:
 *
 */

 #include "..\script_component.hpp"

params ["_tank", "_usedGun"];
private ["_centerofMass", "_recv"];

_centerofMass = getCenterOfMass _tank;

// If player is gunner add camera shake
if (KGE_player call EFUNC(common,isGunner)) then {
    addCamShake [5, 0.5, 25];
};

// Calculate new center of mass from turret direction
_recv = _centerofMass vectorDiff ((
    _tank worldToModelVisual (_tank weaponDirection _usedGun)
    vectorDiff (_tank worldToModelVisual [0, 0, 0])
) vectorMultiply 1.4);

// Return y to original and set new center of mass
_recv set [2, (_centerofMass select 2)];
_tank setCenterOfMass _recv;

// Return center of mass after certain time
[{
    params ["_tank", "_centerofMass"];
    _tank setCenterOfMass _centerofMass;
}, [_tank, _centerOfMass], 0.2] call EFUNC(common,waitUntil);
