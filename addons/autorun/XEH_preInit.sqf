#include "script_component.hpp"

ADDON = false;

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

ADDON = true;
