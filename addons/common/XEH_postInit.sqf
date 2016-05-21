#include "script_component.hpp"

if(hasInterface) then {
    KGE_Player call FUNC(setName);

    call FUNC(checkFiles);
};

KGE_LOGINFO("Common Module Initialized.");
