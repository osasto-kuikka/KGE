/*
 * Author: nikolauska
 *
 * Create player text for teamroster here
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 * teamroster text for player <String>
 */

#include "script_component.hpp"

params ["_unit"];

private _returnString = "";

// Get unit profile name and game name
private _unitName = [_unit] call EFUNC(common,getName);
private _unitDesc = roleDescription _unit;

// Get unit rank
private _unitRank = [_unit] call FUNC(getRank);

// Add whole text to return string
// If unit is leader then add groupID if groupID is set to be shown
if ([_unit] call EFUNC(common,isLeader)) then {
  _returnString = format["<br/>%1 - %2 %3 (%4)<br/>", (group _unit), _unitRank, _unitName, _unitDesc]
} else {
  _returnString = format["	-	%1 %2 (%3)<br/>", _unitRank, _unitName, _unitDesc];
};

_returnString
