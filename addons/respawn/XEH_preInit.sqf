#include "script_component.hpp"

ADDON = false;

PREP(addActionsKill);
PREP(addActionsRespawn);
PREP(animationLock);
PREP(clientEvent);
PREP(getAllDead);
PREP(getmarkerPosition);
PREP(handleKilled);
PREP(handleRespawn);
PREP(killAll);
PREP(killSingle);
PREP(moduleInit);
PREP(onKilled);
PREP(onRespawn);
PREP(respawnAll);
PREP(respawnSingle);
PREP(serverEvent);

GVAR(playerList) = [];
GVAR(maxKilled) = 0;
GVAR(respawn) = [];
GVAR(death) = [];

GVAR(active) = false;

ADDON = true;
