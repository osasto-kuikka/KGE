#include "script_component.hpp"

ADDON = false;

PREP(addActionsRespawn);
PREP(animationLock);
PREP(clientEvent);
PREP(getAllDead);
PREP(getmarkerPosition);
PREP(handleKilled);
PREP(handleRespawn);
PREP(moduleInit);
PREP(onKilled);
PREP(onRespawn);
PREP(respawnAll);
PREP(respawnSingle);
PREP(serverEvent);

GVAR(playerList) = [];
GVAR(maxKilled) = 0;
GVAR(active) = false;
GVAR(respawn) = [];
GVAR(death) = [];

ADDON = true;
