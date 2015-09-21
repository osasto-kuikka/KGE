#include "script_component.hpp"

if(hasInterface) then {
    KGE_Player call FUNC(setName);

    ["KGE_SystemChatEvent", {
        params ["_msg"];
        systemChat _msg;
    }] call cba_fnc_addEventHandler;
};

call FUNC(checkFiles);
