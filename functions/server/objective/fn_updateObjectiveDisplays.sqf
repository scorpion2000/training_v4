params ["_status", "_trigger"];

_type = _trigger getVariable ["objectiveType", ""];
systemChat str _type;
if (_type == "") exitWith {systemChat str "ERROR: Tried Updating Displays Without Objectives"};

_typeText = if (_type == "vip") then {"VIP Rescue"} else {"Disable Radars"};
_text = format ["Objective: %1\nStatus: %2",_typeText, _status];

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.1,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _text];

_displays = _trigger getVariable ["objectiveDisplays", []];

{
	_x setObjectTextureGlobal [0, _texture];
} forEach _displays;