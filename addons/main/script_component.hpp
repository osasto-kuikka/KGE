#define COMPONENT main
#define COMPONENT_BEAUTIFIED Main

#ifdef DEBUG_ENABLED_MAIN
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAIN
  #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN
#endif

#include "script_mod.hpp"
#include "script_macros.hpp"
