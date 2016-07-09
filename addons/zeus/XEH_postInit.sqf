#include "script_component.hpp"

if(isServer) then {
    call FUNC(serverInit);

    [QGVAR(activateEvent), {
        _this call FUNC(activateServer);
    }] call CBA_fnc_addEventHandler;

    [{
        [objNull, false] call FUNC(activateServer);
    }, 10, []] call cba_fnc_addPerFrameHandler;
};

KGE_LOGINFO("Zeus Module Initialized.");
