#define b 1
#define d 0.35

_this call {
	if(_this == west) 		 exitWith {[0.45, 0.45, b, 0.9]};
	if(_this == east) 		 exitWith {[b, d, d, 0.9]};
	if(_this == independent) exitWith {[d, b, d, 0.9]};
	[b, b, b, 0.9]	
}
