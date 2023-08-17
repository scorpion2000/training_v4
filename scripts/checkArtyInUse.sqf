_message = wsot_artyInUseMessage select wsot_preferedLanguage;

_artyInUse = false;
while { true } do {
	if (_artyInUse) then {sleep 25};

	{
		if (_x inArea arty_inUse_t) then {
			if !(_artyInUse) then {
				[0.4, _message] remoteExec ["wsot_fnc_changeArtyMarkers", 0, false];
			};
			_artyInUse = true;
			break;
		};

		if (_artyInUse) then {[0.05, _message] remoteExec ["wsot_fnc_changeArtyMarkers", 0, false]};
		_artyInUse = false;
	} foreach allPlayers;
	sleep 5;
};