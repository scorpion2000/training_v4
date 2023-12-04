params ["_alpha", ["_message", "ERROR: No Message By The Server! (ARTY_IN_USE)"]];

_markers = ["arty_marker_5", "arty_marker_4", "arty_marker_3", "arty_marker_2", "arty_marker_1"];

{
	_x setMarkerAlphaLocal _alpha;
} forEach _markers;

100 cutText [_message, "PLAIN DOWN"];
sleep 8;
100 cutFadeOut 5;