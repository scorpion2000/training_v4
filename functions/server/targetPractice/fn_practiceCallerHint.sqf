params ["_callingPlayer", "_messageID", "_value"];

switch (_messageID) do {
	case 0: { 
		[
			(format ["%1: %2", 
			wsot_practiceCurrentTargets select wsot_preferedLanguage, 
			_value])
		] remoteExec ["hint", (owner _callingPlayer), false]; 
	};
	case 1: { 
		[
			(format ["%1: %2", 
			wsot_practiceCurrentTimer select wsot_preferedLanguage, 
			_value])
		] remoteExec ["hint", (owner _callingPlayer), false]; 
	};
	case 2: { 
		[
			(format ["%1: %2", 
			wsot_practiceTargetsHit select wsot_preferedLanguage, 
			_callingPlayer getVariable ["practice_hits", 0]])
		] remoteExec ["hint", (owner _callingPlayer), false]; 
		_callingPlayer setVariable ["practice_hits", nil];
	};
	case 3: { 
		[
			(format ["%1", wsot_practiceStarting select wsot_preferedLanguage])
		] remoteExec ["hint", (owner _callingPlayer), false]; 
	};
	default { };
};

