/*
 * Author: nikolauska
 *
 * Draws 3D compass for helicopter gunner
 *
 * Argument:
 * None.
 *
 * Return value:
 * None.
 */

#include "..\script_component.hpp"

if(cameraView != "GUNNER") exitWith {};

{
    private ["_center"];
    _center = positionCameraToWorld [0,0,3];

    _x params ["_letter", "_color", "_offset1", "_offset2"];
    drawIcon3D [
        "",
        _color,
        _center vectorAdd _offset1,
        0,
        0,
        0,
        _letter,
        2,
        0.05,
        "PuristaMedium"
    ];
    drawIcon3D [
        "",
        _color,
        _center vectorAdd _offset2,
        0,
        0,
        0,
        ".",
        2,
        0.05,
        "PuristaMedium"
    ];
} count [
    ["N",[1,1,1,1],[0,1,0],[0,0.5,0]],
    ["S",[1,1,1,0.7],[0,-1,0],[0,-0.5,0]],
    ["E",[1,1,1,0.7],[1,0,0],[0.5,0,0]],
    ["W",[1,1,1,0.7],[-1,0,0],[-0.5,0,0]]
];
