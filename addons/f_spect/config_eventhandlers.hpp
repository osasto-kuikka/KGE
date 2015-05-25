#include "script_component.hpp"

class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call COMPILE_FILE(XEH_PreInit) );
  };
};
