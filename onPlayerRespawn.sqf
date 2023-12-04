params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

_loadout = _oldUnit getVariable ["respawnLoadout", []];

player setUnitLoadout _loadout;