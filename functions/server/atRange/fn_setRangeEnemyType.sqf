params ["_controller", "_type"];

_factionFile = format ["scripts\factions\vehicles\%1.sqf", _type];

_factionData = [] call compile preprocessFileLineNumbers _factionFile;

_controller setVariable ["enemy_car", (_factionData select 0)];
_controller setVariable ["enemy_apc", (_factionData select 1)];
_controller setVariable ["enemy_tank", (_factionData select 2)];