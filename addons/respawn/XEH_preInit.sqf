#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(playerList) = [];
GVAR(maxKilled) = 0;
GVAR(respawn) = [];
GVAR(death) = [];

GVAR(active) = false;

ADDON = true;
