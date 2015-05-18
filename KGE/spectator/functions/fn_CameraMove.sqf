// TODO: Change fnc name
//--- Nelson's solution for key lag

private ["_dX","_dY","_dZ","_coef", "_dir","_camPos"];

_dX = _this select 0;
_dY = _this select 1;
_dZ = _this select 2;
_coef = _this select 3;
_pos = getposasl KGE_Spectator_camera;
_dir = (direction KGE_Spectator_camera) + _dX * 90;
_camPos = [
	(_pos select 0) + ((sin _dir) * _coef * _dY),
	(_pos select 1) + ((cos _dir) * _coef * _dY),
	(_pos select 2) + _dZ * _coef
];
_camPos set [2,(_camPos select 2) max (getterrainheightasl _camPos)];
KGE_Spectator_camera setposasl _camPos;