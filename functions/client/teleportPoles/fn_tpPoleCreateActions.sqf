params ["_flags"];

_sortedFlags = [_flags, [], {_x getVariable ["displayName", ""]}, "ASCEND"] call BIS_fnc_sortBy;
{
	_flag = _x;
	{
		if (_x == _flag) then {continue};
		_flag addAction [
			format ["<t color='#31c916' font='PuristaBold'>%1</t>", _x getVariable ["displayName", ""]],
			{
				_emptySpace = getPos (_this select 3) findEmptyPosition [0,10,typeOf (_this select 1)];
				(_this select 1) setPos _emptySpace;
			},
			_x
		];
	} forEach _sortedFlags;
} forEach _sortedFlags;