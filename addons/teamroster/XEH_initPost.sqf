#include "script_component.hpp"

[{
    KGE_Player createDiarySubject [QGVAR(diarySubject), "Teamroster"];

    [{
      // Update teamroster text
      call FUNC(update);
    }, 600, []] call CBA_fnc_addPerFrameHandler;
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);

KGE_LOGINFO("Teamroster Module Initialized.");
