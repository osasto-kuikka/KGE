#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"kge_common"};
    authors[] = {"nikolauska"};
    VERSION_CONFIG;
  };
};

#include "config_eventhandlers.hpp"
#include "config_vehicles.hpp"
