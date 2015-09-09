/*
 * Author: nikolauska
 *
 * Chack if player can autorun
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

private ["_gradient", "_fatigue"];

if(!alive KGE_Player) exitWith {false};
if(vehicle KGE_Player != KGE_Player) exitWith {false};
if(surfaceIsWater position KGE_Player) exitWith {false};

// If KGE respawn is used
if(!GVAR(alive)) exitWith {false};

// No need for fatigue and gradient check for walking
if(GVAR(autoRunMode) isEqualTo WALK) exitWith {true};

_gradient = KGE_Player call FUNC(getTerrainGradient);
_fatigue = getFatigue KGE_Player;

if(_fatigue > GVAR(fatigueThreshold)) exitWith {false};
if(_gradient < GVAR(terrainGradientMaxDecline)) exitWith {false};
if(_gradient > GVAR(terrainGradientMaxIncline)) exitWith {false};

true;
