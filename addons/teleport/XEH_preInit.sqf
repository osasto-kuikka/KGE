#include "script_component.hpp"

ADDON = false;

PREP(addRespawnActionsMap);
PREP(addRespawnActionsMe);
PREP(addSingleActionsMap);
PREP(addSingleActionsMe);
PREP(toBehind);
PREP(mapPosition);
PREP(teleportAllMap);
PREP(teleportAllMe);
PREP(teleportRespawnMap);
PREP(teleportRespawnMe);
PREP(toVehicle);

GVAR(respawned) = [];

ADDON = true;
