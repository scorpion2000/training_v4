waitUntil { !isNull ( uiNamespace getVariable [ "RscDiary", displayNull ] ) };

{
	if (_x find "wsot_hideOnScroll" != -1) then {
		_x setMarkerAlphaLocal 0;
	};
} forEach allMapMarkers;

wsot_l_mapMarkerSmall = [];
wsot_l_mapMarkerLarge = [];
{
	if (_x find "wsot_hideOnScroll" != -1) then {
		wsot_l_mapMarkerSmall pushback _x;
		_x setMarkerAlphaLocal 0;
	};
	if (_x find "wsot_hideLarge" != -1) then {
		wsot_l_mapMarkerLarge pushback _x;
		_x setMarkerAlphaLocal 0;
	};
} forEach allMapMarkers;

uiNamespace getVariable "RscDiary" displayCtrl 51 ctrlAddEventHandler [ "MouseZChanged", {
	params[ "_ctrl" ];
	
	_zoom = ctrlMapScale _ctrl;
	_showSmall = _zoom < 0.025;
	_showLarge = _zoom < 0.15;
	
	{
		_x setMarkerAlphaLocal ( parseNumber _showSmall );
	} forEach wsot_l_mapMarkerSmall;

	{
		_x setMarkerAlphaLocal ( parseNumber _showLarge );
	} forEach wsot_l_mapMarkerLarge;
	
}];