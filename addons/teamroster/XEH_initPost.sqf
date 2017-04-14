#include "script_component.hpp"

[{!(isNull KGE_Player)}, {
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Teamroster"];

	[{
		// Update teamroster text
		call FUNC(update);
	}, 600, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

KGE_LOGINFO("Teamroster Module Initialized.");
