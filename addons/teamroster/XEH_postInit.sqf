#include "script_component.hpp"

[{
	// Add Diary Subject
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Team Roster"];

	// Update team roster text
	call FUNC(update);
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);
