// Add Diary Subject
if (!(KGE_Player diarySubjectExists "KGE_Gear")) then
{
	KGE_Player createDiarySubject ["KGE_Gear", localize "STR_Gear_DiarySubject"];
};

KGE_Player setVariable ["KGE_Gear_DialogCount", 0];

[] spawn {
	while {true} do {
		_timer = diag_tickTime + 300;

		[] call KGE_Gear_fnc_CreateDiary;

		waitUntil {diag_tickTime > _timer};
	};
};