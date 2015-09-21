#include "script_component.hpp"

ADDON = false;

PREP(assignedItems);
PREP(backpack);
PREP(diary);
PREP(imageCheck);
PREP(items);
PREP(magazines);
PREP(weapons);

GVAR(addedItems) = 0;
GVAR(iteration) = 1;

ADDON = true;
