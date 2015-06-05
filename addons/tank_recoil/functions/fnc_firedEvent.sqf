/*
 * Author: nikolauska
 *
 * Code run on vehicle fired event
 *
 * Argument:
 * 0: Vehicle (Object)
 * 1: Turret (String)
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

_tank = _this select 0;
_centerofMass = getCenterOfMass _tank;
_turret = format["%1", (_tank weaponsTurret [0] select 0)];

if (_this select 1 == _turret) then { 
    _recv = _centerofMass vectorDiff ((
        _tank worldToModelVisual (_tank weaponDirection _turret) 
        vectorDiff (_tank worldToModelVisual [0, 0, 0])
    ) vectorMultiply 1.4);
    _recv set [2, (_centerofMass select 2)];
    _tank setCenterOfMass _recv;
    if (player in _tank && cameraView == 'GUNNER') then {
        addCamShake [5, 0.5, 25];
    };  
    [_tank, _centerOfMass] spawn {
        uiSleep 0.2; 
        (_this select 0) setCenterOfMass (_this select 1);
    };
};