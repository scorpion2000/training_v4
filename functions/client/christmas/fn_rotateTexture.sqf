params ["_textureObj"];

while {!isNull _textureObj} do
{
	_rel = _textureObj getRelDir getPos player;
	_textureObj setDir (getDir _textureObj) + _rel + 180;
	sleep 0.2;
};