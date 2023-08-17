/*	
*	This functin is responsible for setting up the Bombing Range with
*	specific factions and vehicle types
*/

//Sice we only control faction and type, _categoryF is a boolean
params ["_controller", "_element", "_categoryF", "_remove"];

if (_categoryF) then {
	if (_remove && (_element in wsot_allFactionsBRange)) then {
		wsot_allFactionsBRange deleteAt (wsot_allFactionsBRange find _element);
	};
	if (!_remove && !(_element in wsot_allFactionsBRange)) then {
		wsot_allFactionsBRange pushBack _element;
	};
} else {
	if (_remove && (_element in wsot_allTypesBRange)) then {
		wsot_allTypesBRange deleteAt (wsot_allTypesBRange find _element);
	};
	if (!_remove && !(_element in wsot_allTypesBRange)) then {
		wsot_allTypesBRange pushBack _element;
	};
};

wsot_bRangeForceRedeploy = true;
[_controller, ""] remoteExec ["wsot_fnc_bRangeController", 2, false];