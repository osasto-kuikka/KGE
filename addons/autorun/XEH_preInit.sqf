#include "script_component.hpp"

ADDON = false;

PREP(actionKeyCheck);
PREP(canAutoRun);
PREP(getAnimation);
PREP(getTerrainGradient);
PREP(toggleMode);
PREP(toggleOn);

GVAR(autoRunMode) = JOG;
GVAR(isAutoRunActive) = false;
GVAR(terrainGradientMaxIncline) = 30;
GVAR(terrainGradientMaxDecline) = -30;
GVAR(fatigueThreshold) = 0.7;
GVAR(alive) = true;
GVAR 
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
GVAR(disablingAnimation) = ["amovppnemstpsraswrfldnon", "amovpercmstpsnonwnondf", "amovpercmrunsnonwnondf"];

ADDON = true;
