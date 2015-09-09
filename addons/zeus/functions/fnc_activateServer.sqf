/*
 * Author: nikolauska
 *
 * Assign given unit as zeus curator on server
 *
 * Argument:
 * 0: Admin unit <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_unit"];

// Remove old curator
if !(isNil QGVAR(assignedCurator)) then {
    unassignCurator GVAR(curatorModule);
};

// Assign new curator
GVAR(assignedCurator) = _unit;
_unit assignCurator GVAR(curatorModule);

{
    _curator = _x;

    //Add all object in mission to editable
    _curator addCuratorEditableObjects [vehicles,true];
    _curator addCuratorEditableObjects [allUnits, true];
    _curator addCuratorEditableObjects [(allMissionObjects "Man"),false];
    _curator addCuratorEditableObjects [(allMissionObjects "Air"),true];
    _curator addCuratorEditableObjects [(allMissionObjects "Ammo"),false];

    // Reduce costs for all actions
    _curator setCuratorWaypointCost 0;
    {_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];
} forEach allCurators;
