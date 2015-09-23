/*	Tracks the players and sets the variables accordingly
/*
/*  No Params
*/

[{
	{
		if ([_x] call FUNC(blacklistCheck)) exitWith {

		};
	} forEach (call cba_fnc_players);
}, 10, []] call cba_fnc_addPerFrameHandler;
