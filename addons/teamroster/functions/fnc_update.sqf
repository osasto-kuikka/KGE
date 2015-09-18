/*
 * Author: nikolauska
 *
 * Updates teamroster text
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

private ["_title", "_teamrosterText", "_groupText"];

_teamrosterText = "";

// Loop throug all players and add them to teamroster text
{
	_teamrosterText = _teamrosterText + ([_x] call FUNC(getPlayerEntry));

    true;
} count (call cba_fnc_players);

_title = format["%1 - %2", side (group KGE_Player), GVAR(iteration)];

// Add diary text
KGE_Player createDiaryRecord [QGVAR(diarySubject), [_title, _teamrosterText]];

// Increase iteration number
INC(GVAR(iteration));
