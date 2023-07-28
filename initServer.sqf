wsot_preferedLanguage = 0;

[] call compile preprocessFileLineNumbers "scripts\stringTable.sqf";	//Server has to wait for this
[] execVM "scripts\factions\allFactions.sqf";
[] execVM "scripts\objectSetups.sqf";