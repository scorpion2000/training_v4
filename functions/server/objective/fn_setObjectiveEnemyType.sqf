params ["_controller", "_type", "_callingPlayer"];

_factionFile = format ["scripts\factions\units\%1.sqf", _type];

_factionData = [] call compile preprocessFileLineNumbers _factionFile;

_controller setVariable ["enemy_regulars", (_factionData select 0)];
_controller setVariable ["enemy_special", (_factionData select 1)];
_controller setVariable ["enemy_unarmed", (_factionData select 2)];

[
	(format ["%1 %2", 
		_type,
		wsot_factionSelectedText select wsot_preferedLanguage
	])
] remoteExec ["hint", (owner _callingPlayer), false];