//The _targetDead variable is optional, and comes in from a killed eventhandler on the target
params ["_controller", "_impactPosition", ["_target", objNull]];

_display = missionNamespace getVariable [[(_controller getVariable ["rangeName", ""]), "display"] joinString "_", []];
_targetForDistance = _controller getVariable ["target", objNull];

if (isNull _targetForDistance) exitWith {};

_targetDamageText = "";

if (isNull _target) then {
	_targetDamageText = "Target Unharmed";
} else {
	_targetDamageText = if ((damage _target) == 1) then {"Target Destroyed"} else {"Target Hit"};
};

if (count _impactPosition != 0) then {
	_display setVariable ["impactPos", _impactPosition];
};


_text = "Impact Distance To Target";
_text = [_text, format ["%1m", (round (_targetForDistance distance (_display getVariable ["impactPos", [0,0,0]])))]] joinString "\n";
_text = [_text, "\n"] joinString "\n";
_text = [_text, _targetDamageText] joinString "\n";

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.1,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _text];

_display setObjectTextureGlobal [0, _texture];