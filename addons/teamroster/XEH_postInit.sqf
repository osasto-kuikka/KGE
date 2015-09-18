#include "script_component.hpp"

[{
	// Add Diary Subject
	KGE_Player createDiarySubject [QGVAR(diarySubject), "team roster"];

	[{
		// Update team roster text
		call FUNC(update);
	}, 300, []] call CBA_fnc_addPerFrameHandler;
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);
