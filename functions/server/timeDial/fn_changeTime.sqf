params ["_expectedTime"];

_toJump = _expectedTime - (floor dayTime);
skipTime _toJump;