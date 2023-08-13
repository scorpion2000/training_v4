params ["_controllers"];

filtered = [[],[],[],[],[]];
_cfg = (configFile >> "CfgVehicles");
for "_i" from 0 to ((count _cfg)-1) do {
	if (isClass ((_cfg select _i) ) ) then {
		_cfgName = configName (_cfg select _i);
		if ( 
			!(_cfgName isKindOf "CAManBase") && 
			(_cfgName isKindOf "LandVehicle") &&
			(getNumber ((_cfg select _i) >> "scope") == 2) ) 
		then {
			_side = getNumber ((_cfg select _i) >> "side");
			_temp = filtered select _side;
			_temp set [count _temp, _cfgName ];
			filtered set [_side, _temp];
		};
	};
};

_factionsToUse = [
	"Russia (VDV)",
	"Russia (VV)",
	"USA (Army - D)",
	"USA (SOCOM)",
	"USA (USAF)",
	"USA (USMC - D)",
	"NATO",
	"CSAT",
	"Civilians"
];
_subCategoryToUse = [
	"Anti-Air",
	"Cars",
	"APC",
	"APCs",
	"Artillery",
	"Tank",
	"Tanks",
	"Anti-Air",
	"IFV",
	"MRAP",
	"Truck",
	"IFV"
];
_vehicleTypeExceptions = [];	//Write partial classname here

{systemChat str count _x} forEach filtered;

_factions = [];
_categories = [];
{
	_side = _x;
	{
		_classname = _x;
		if (_vehicleTypeExceptions findIf {_classname find _x} != -1) then {continue};

		_factionClassname = getText (configFile >> "CfgVehicles" >> _classname >> "faction");
		_factionName = getText (configFile >> "CfgFactionClasses" >> _factionClassname >> "displayName");
		_subCat = getText (configFile >> "CfgVehicles" >> _classname >> "editorSubcategory");
		_subCatName = getText (configFile >> "CfgEditorSubcategories" >> _subCat >> "displayName");

		if !(_factionName in _factionsToUse) then {continue};
		if !(_subCatName in _subCategoryToUse) then {continue};

		if !(_factionClassname in _factions) then {
			_factions pushback _factionClassname;
			if (isNil "_factionName" || _factionName == "") then {systemChat str _factionClassname};
			_action = [_factionClassname, _factionName, "", {}, {true}] call ace_interact_menu_fnc_createAction;
			{
				[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
			} forEach _controllers;
		};

		_subCheckName = [_factionClassname, _subCat] joinString "_";
		if !(_subCheckName in _categories) then {
			_categories pushback _subCheckName;
			_action = [_subCat, _subCatName, "", {}, {true}] call ace_interact_menu_fnc_createAction;
			{
				[_x, 0, ["ACE_MainActions", _factionClassname], _action] call ace_interact_menu_fnc_addActionToObject;
			} forEach _controllers;
		};

		_name = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		_action = [_className, _name, "", {
			params ["_target", "_player", "_params"];
			_trigger = missionNamespace getVariable [[(_target getVariable ["controlGroup", ""]),"trigger"] joinString "_", objNull];
			_positions = _trigger getVariable ["spawnPositions", []];
			_sortedPositions = [_positions, [], {_x distance _player}, "ASCEND"] call BIS_fnc_sortBy;
			_spawnPos = [];
			{
				if (count _spawnPos != 0) then {break};
				_spawnPos = _x findEmptyPosition [0,1,(_params select 0)];
			} forEach _sortedPositions;

			if (count _spawnPos != 0) then {
				_vehicle = createVehicle [(_params select 0), _spawnPos, [], 0, "CAN_COLLIDE"];
				_vehicle setDir (getDir _target) + 90;
			};
		}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;
		{
			[_x, 0, ["ACE_MainActions", _factionClassname, _subCat], _action] call ace_interact_menu_fnc_addActionToObject;
		} forEach _controllers;
	} forEach _side;
} forEach filtered;

_text = "";
{
	[_text, (str _x)] joinString "\n";
} forEach _factions;
hint _text;