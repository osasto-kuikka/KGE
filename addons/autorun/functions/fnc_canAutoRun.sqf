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
if(surfaceIsWater (getPosASL KGE_Player)) exitWith {false};

// If KGE respawn is used
if !(KGE_Player getVariable ["KGE_alive", true]) exitWith {false};

// No need for fatigue and gradient check for walking
if(GVAR(autoRunMode) isEqualTo WALK) exitWith {true};

_gradient = KGE_Player call FUNC(getTerrainGradient);
_fatigue = getFatigue KGE_Player;

if(_fatigue > GVAR(fatigueThreshold)) then { GVAR(autoRunMode) = WALK };
if(_gradient < GVAR(terrainGradientMaxDecline)) then { GVAR(autoRunMode) = WALK };
if(_gradient > GVAR(terrainGradientMaxIncline)) then { GVAR(autoRunMode) = WALK };

// Disable running when weapon is holstered
if((animationState KGE_Player) in GVAR(disablingAnimation)) exitWith {false};

true;
