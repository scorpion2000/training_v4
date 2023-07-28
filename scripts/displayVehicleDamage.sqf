params ["_vehicle"];

sleep 0.2;

_hp = getAllHitPointsDamage _vehicle;

_string = "Wheel Damage:";

{
    if (_x find "wheel" != -1) then {
		_hitString = if (_x find "wheel_1" != -1) then {"Left Wheel"} else {"Right Wheel"};
		_index = [_x, 0, 8] call BIS_fnc_trimString;
		_index = _index select [count _index - 1,1];
		_s = [[_hitString, _index] joinString " ", (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	}
} forEach (_hp select 1);

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
rb2_db_1 setObjectTextureGlobal [0, _texture];

_string = "Track Damage:";

{
    if (_x find "track" != -1) then {
		_hitString = if (_x find "hitl" != -1) then {"Left Track"} else {"Right Track"};
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	}
} forEach (_hp select 0);

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
rb2_db_2 setObjectTextureGlobal [0, _texture];

_string = format ["Full Damage: %1\nPart Damage:", damage _vehicle];

{
    if (_x find "hitengine" != -1) then {
		_hitString = "Engine";
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitfuel" != -1) then {
		_hitString = "Fuel";
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitbody" != -1) then {
		_hitString = "Body";
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hithull" != -1) then {
		_hitString = if (_x == "hithull_structural") then { "Body Structural" } else {"Hull"};
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitturret" != -1) then {
		if (_x == "hitturretcom") then { continue };
		_hitString = "Turret";
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitgun" != -1) then {
		if (_x == "hitguncom") then { continue };
		_hitString = "Main Gun";
		_s = [_hitString, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};
} forEach (_hp select 0);

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
rb2_db_3 setObjectTextureGlobal [0, _texture];

_string = "Damaged ERA and/or SLAT:";
_hpArray = +(_hp select 0);
_hasEraOrSlat = false;
{
	if (_x find "slat" != -1) then {
		_hasEraOrSlat = true;
		if ((_hp select 2) select _foreachindex == 0) then { continue };
		_s = [_x, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "era" != -1) then {
		_hasEraOrSlat = true;
		if ((_hp select 2) select _foreachindex == 0) then { continue };
		_s = [_x, (_hp select 2) select _foreachindex] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};
} forEach (_hp select 0);

if (!_hasEraOrSlat) then {
	_s = "Vehicle has no ERA or SLAT!";
	_string = [_string, _s] joinString "\n";
};

_texture = format ["#(rgb,1024,1024,3)text(0,0,%1,0.055,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
rb2_db_4 setObjectTextureGlobal [0, _texture];