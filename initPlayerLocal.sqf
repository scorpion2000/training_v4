if !("ACE_EarPlugs" in items player) then {
	player addItem "ACE_EarPlugs";
};

if !(count ([] call acre_api_fnc_getCurrentRadioList) <= 0) then {
	player addItem "ACRE_PRC343";
};

[] execVM "scripts\createAceStaticActions.sqf";