params ["_controller", "_time"];

_textColor = "#f5f5f5";
if (_time <= 5) then { _textColor = "#ff0000" };
_texture = format ["#(rgb,256,256,1)text(1,1,%1,0.2,%2,%3,%4)", "LCD14", "#1a1a1a", _textColor, _time];
_controller setObjectTextureGlobal [0, _texture];