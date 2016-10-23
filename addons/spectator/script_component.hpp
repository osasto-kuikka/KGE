#define COMPONENT spectator
#define COMPONENT_BEAUTIFIED Spectator

#ifdef DEBUG_ENABLED_SPECTATOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPECTATOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPECTATOR
#endif

#include "\z\kge\addons\main\script_mod.hpp"
#include "\z\kge\addons\main\script_macros.hpp"
