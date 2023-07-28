params ["_vehicle", "_localPlayer"];

systemChat str _localPlayer;
systemChat str _vehicle;

while {(damage _vehicle < 1 && (!isNil "_vehicle" || _vehicle != objNull))} do {
	_string = _vehicle distance _localPlayer;
	_texture = format ["#(rgb,512,512,3)text(1,1,%1,0.4,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
	rb2_rb setObjectTexture [0, _texture];
	rb2_rb setObjectTexture [1, _texture];

	sleep 0.5;
};

_string = "-";
_texture = format ["#(rgb,512,512,3)text(1,1,%1,0.4,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
rb2_rb setObjectTexture [0, _texture];
rb2_rb setObjectTexture [1, _texture];