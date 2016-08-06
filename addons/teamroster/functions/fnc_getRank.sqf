/*
 * Author: nikolauska
 *
 * Gets unit rank as text from rankID
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 * Unit rank <String>
 */

#include "script_component.hpp"

params ["_unit"];

private _rank = rankId _unit;

if(_rank == 0) exitWith {"Private"};
if(_rank == 1) exitWith {"Corporal"};
if(_rank == 2) exitWith {"Sergeant"};
if(_rank == 3) exitWith {"Lieutenant"};
if(_rank == 4) exitWith {"Captain"};
if(_rank == 5) exitWith {"Major"};
if(_rank == 6) exitWith {"Colonel"};

""
