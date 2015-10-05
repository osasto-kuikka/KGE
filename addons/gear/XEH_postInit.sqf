#include "script_component.hpp"

[{
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Group Gear"];

	// Update gear text
	call FUNC(diary);
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);

KGE_LOGINFO("Gear Module Initialized.");
