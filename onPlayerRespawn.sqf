params ["_player", "_killer", "_respawnDelay"];

_loadout = player getVariable ["respawnLoadout", []];

player setUnitLoadout _loadout;