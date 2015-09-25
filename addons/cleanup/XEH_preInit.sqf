#include "script_component.hpp"

ADDON = false;

PREP(deadCheck);
PREP(emptyCheck);
PREP(groupCheck);

GVAR(groupList) = [];
GVAR(groupIterator) = 0;

GVAR(maxTime) = 300;
GVAR(maxDistance) = 500;

ADDON = true;
