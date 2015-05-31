#define b 1
#define d 0.35

_this call {
	if(_this == 0) exitWith {[b, d, d, 0.9]};		// east
	if(_this == 1) exitWith {[0.45, 0.45, b, 0.9]};	// west
	if(_this == 2) exitWith {[d, b, d, 0.9]};		// independent
	[b, b, b, 0.9]
}
