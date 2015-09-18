#include "script_component.hpp"

ADDON = false;

PREP(activateClient);
PREP(activateServer);
PREP(serverInit);

GVAR(player) = player;

ADDON = true;
