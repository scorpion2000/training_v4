_hasAdmin = false;
_adminOnlineMsg = "An admin is online\n\nPlease request permission\nbefore using anything\nin this section";
_adminOfflineMsg = "No admin online\n\nPlease warn others\nbefore using anything\nin this section";

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

sleep 3;

while { true } do {
	if (_hasAdmin) then {sleep 30};

	{
		if (admin (owner _x) != 0 || (owner _x == 2)) then {
			if !(_hasAdmin) then {
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
			};
			_hasAdmin = true;
			break;
		};
		if (_hasAdmin) then {
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
			_hasAdmin = false;
		};
	} forEach allPlayers;

	sleep 10;
};