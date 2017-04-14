#define COMPONENT autorun
#define COMPONENT_BEAUTIFIED Autorun

#ifdef DEBUG_ENABLED_AUTORUN
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AUTORUN
  #define DEBUG_SETTINGS DEBUG_SETTINGS_AUTORUN
#endif

#include "\z\kge\addons\main\script_mod.hpp"
#include "\z\kge\addons\main\script_macros.hpp"

#define WALK QUOTE(walk)
#define JOG QUOTE(jog)
#define SPRINT QUOTE(sprint)
