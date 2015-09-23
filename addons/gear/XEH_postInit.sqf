#include "script_component.hpp"

[{
	KGE_Player createDiarySubject [QGVAR(diarySubject), "Group Gear"];

	// Update gear text
	call FUNC(diary);
}, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);

["KGE_PlayerChanged", {
	params ["_newUnit", "_oldUnit"];

	_newUnit call FUNC(diary);
}] call cba_fnc_addEventHandler;
