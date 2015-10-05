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

#include "..\script_component.hpp"

params ["_unit"];
private ["_returnString", "_unitName", "_unitDesc", "_unitRank"];

_returnString = "";

// If unit is null or dead then don't add any text
if (!(alive _unit) || !(_unit getVariable [QEGVAR(respawn,alive), true])) exitWith {""};


// If unit is leader then add groupID if groupID is set to be shown
if ([_unit] call EFUNC(common,isLeader)) then {
	_returnString = "<br/>" + format["%1<br/>", (group _unit)]
};
_returnString = _returnString + "		";

// Get unit profile name and game name
_unitName = [_unit] call EFUNC(common,getName);
_unitDesc = roleDescription _unit;

// Get unit rank
_unitRank = [_unit] call FUNC(getRank);

// Add whole text to return string
_returnString = _returnString + format["%1 %2 (%3)<br/>", _unitRank, _unitName, _unitDesc]; // "Alpha Squad - Sgt. Crackman (Squad Leader)" or "    Pvt. Crackman (Machinegunner)"

_returnString
