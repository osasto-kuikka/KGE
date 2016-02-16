#include "script_component.hpp"

[{
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Group Gear"];

    // Hack to slow down execution of diary
    for "_i" from 0 to 20 do {
        call {};
    };

	// Update gear text
    call FUNC(diary);
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);

KGE_LOGINFO("Gear Module Initialized.");
