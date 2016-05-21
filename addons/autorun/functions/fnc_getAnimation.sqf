/*
 * Author: nikolauska
 *
 * Get player animation based on weapon and autorun mode
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_mode"];
private ["_weapon"];

_weapon = currentWeapon KGE_Player;


call {
    if(_mode == SPRINT) exitWith {
        if(_weapon == "")                         exitWith {"amovpercmevasnonwnondf"};
        if(_weapon == handgunWeapon KGE_Player)   exitWith {"amovpercmevaslowwpstdf"};
        if(_weapon == primaryWeapon KGE_Player)   exitWith {"amovpercmevaslowwrfldf"};
        if(_weapon == secondaryWeapon KGE_Player) exitWith {"amovpercmevaslowwlnrdf"};
        if(_weapon == binocular KGE_Player)       exitWith {"amovpercmevasnonwbindf"};
    };
    if(_mode == WALK) exitWith {
        if(_weapon == "")                         exitWith {"amovpercmwlksnonwnondf"};
        if(_weapon == handgunWeapon KGE_Player)   exitWith {"amovpercmwlkslowwpstdf"};
        if(_weapon == primaryWeapon KGE_Player)   exitWith {"amovpercmwlkslowwrfldf"};
        if(_weapon == secondaryWeapon KGE_Player) exitWith {"amovpercmwlksraswlnrdf"};
        if(_weapon == binocular KGE_Player)       exitWith {"amovpercmwlksoptwbindf"};
    };
    if(_mode == JOG) exitWith {
        if(_weapon == "")                         exitWith {"amovpercmrunsnonwnondf"};
        if(_weapon == handgunWeapon KGE_Player)   exitWith {"amovpercmrunslowwpstdf"};
        if(_weapon == primaryWeapon KGE_Player)   exitWith {"amovpercmrunslowwrfldf"};
        if(_weapon == secondaryWeapon KGE_Player) exitWith {"amovpercmrunsraswlnrdf"};
        if(_weapon == binocular KGE_Player)       exitWith {"amovpercmrunsnonwbindf"};
    };
};
