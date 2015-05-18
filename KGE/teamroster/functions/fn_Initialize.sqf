if (!hasInterface) exitWith {};

// Set teamroster initialization false to show that we started, but are not ready yet
KGE_TeamRoster_Initialized = false;

// Set iteration number
KGE_Player setVariable ["KGE_TeamRoster_Iteration", 1]; // Iteration Number

// Add Diary Subject
if (!(KGE_Player diarySubjectExists "roster")) then
{
	KGE_Player createDiarySubject ["roster", localize "STR_TeamRoster_Subject"];
};

[{
	// Update team roster text
	[false] call KGE_TeamRoster_fnc_Update;
}, 300, []] call CBA_fnc_addPerFrameHandler;


// Mark team roster initialization as ready
KGE_TeamRoster_Initialized = true;