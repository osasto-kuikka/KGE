#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(autoRunMode) = JOG;
GVAR(forceWalk) = false;
GVAR(isAutoRunActive) = false;
GVAR(terrainGradientMaxIncline) = 30;
GVAR(terrainGradientMaxDecline) = -30;
GVAR(fatigueThreshold) = 0.7;
GVAR(alive) = true;
GVAR(disablingActions) = [
	"MoveForward",
	"MoveBack",
	"MoveUp",
	"MoveDown",
	"MoveLeft",
	"MoveRight",
	"TurnLeft",
	"TurnRight",
	"Crouch",
	"Prone",
	"GetOver",
	"ToggleWeapons",
	"SwitchWeapon",
	"Fire",
	"Optics"
];
GVAR(disablingAnimation) = [];

ADDON = true;
