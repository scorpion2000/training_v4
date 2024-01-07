params ["_parent"];

_textures = [];

//for "_i" from 1 to 4 do
//{
	_i = 1;
	_t = createVehicle ["UserTexture10m_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_t setObjectTexture [0, format ["images\christmas\kep_%1.paa", _i]];

	_t setVariable ["spawn", _i];
	_t setVariable ["index", _i];

	_spawnPos = missionNamespace getVariable format ["cmPos_%1", _i];
	_movePos = missionNamespace getVariable format ["movePos_%1", _i];
	[_t] remoteExec ["wsot_fnc_rotateTexture", clientOwner, false];

	_textures pushBack _t;
	[getPosATL _spawnPos, getPosATL _movePos, _t, format ["t_%1", _i]] remoteExec ["wsot_fnc_lerp", clientOwner, false];

//};

_parent setVariable ["textures", _textures];