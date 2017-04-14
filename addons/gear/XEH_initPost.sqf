#include "script_component.hpp"

[{!(isNull KGE_Player)}, {
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Group Gear"];

	// Update gear text
	call FUNC(diary);
}, []] call CBA_fnc_waitUntilAndExecute;

KGE_LOGINFO("Gear Module Initialized.");
