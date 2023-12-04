params ["_switch"];

if !(_switch) then {
	_texture = format [
		"#(rgb,1024,512,3)text(0,1,%1,0.125,%2,%3,%4)",
		"EtelkaNarrowMediumPro",
		"#1a1a1a",
		"#eb4034",
		_adminOnlineMsg
	];

	{
		_x setObjectTextureGlobal [0, _texture];
	} forEach [adminMsg_4, adminMsg_3, adminMsg_2, adminMsg_1];
} else {
	_texture = format [
		"#(rgb,1024,512,3)text(0,1,%1,0.125,%2,%3,%4)",
		"EtelkaNarrowMediumPro",
		"#1a1a1a",
		"#f5f5f5",
		_adminOfflineMsg
	];
	
	{
		_x setObjectTextureGlobal [0, _texture];
	} forEach [adminMsg_4, adminMsg_3, adminMsg_2, adminMsg_1];
}