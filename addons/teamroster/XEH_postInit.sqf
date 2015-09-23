#include "script_component.hpp"

[{
	// Add Diary Subject
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Team Roster"];

	// Update team roster text every 5 min
	[{
        call FUNC(update);
    }, 300, []] call cba_fnc_addPerFrameHandler
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);
