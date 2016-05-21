/*
 * Author: nikolauska
 *
 * Adds smoke for tank
 * DISABLED!!!
 *
 * Argument:
 * 0: Object
 *
 * Return value:
 *
 */

//#include "\z\kge\addons\tank_recoil\script_component.hpp"

/*
params ["_tank", "_usedGun"];
private ["_smokes", "_pos"];

_smokes = [];
_pos = [
    [0,0,-2],
    [1,-2,-2],
    [2,2,-2],
    [-1,2,-2],
    [-2,-2,-2]
];
{
    private ["_smoke"];
    _smoke = "#particlesource" createVehicle (getpos (vehicle _tank));
    _smoke setParticleClass "MissileEffects1";
    _smoke attachto [(vehicle _tank), _x];

    _smokes pushBack _smoke;
} forEach _pos;


[{
    params["_smokes"];
    {
        deleteVehicle _x;
    } forEach _smokes;
}, [_smokes], 1] call EFUNC(common,waitUntil);
*/
