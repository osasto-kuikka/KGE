#define listBox 2101;

_curIndex = lbCurSel listBox;
lbClear listBox;

_normal = _this select 0;
_nv = _this select 1;
_tiBHO = _this select 2;
_tiWHO = _this select 3;

camUseNVG false;
false setCamUseTi 0;
false setCamUseTi 1;

// NV
if(_nv) then {
	camUseNVG true;
};

// blackhot
if(_tiBHO) then {
    true setCamUseTi 1;
};

// whtiehot
if(_tiWHO) then {
    true setCamUseTi 0;
};

// Add texts to list
KGE_Spectator_lb_toggleNormal = lbAdd [listBox,"Normal"];
KGE_Spectator_lb_toggletiNVIndex = lbAdd[listBox,"NV"];
KGE_Spectator_lb_toggletiBHIndex = lbAdd[listBox,"TI - Blackhot"];
KGE_Spectator_lb_toggletiWHIndex = lbAdd[listBox,"TI - Whitehot"];

