//The HandleDisconnect EH gives the dead body to the server :\
params ["_player", ["_source", objNull]];

if !(isNull _source) then {
	_player setVariable ["thisOwner", (owner _source)];
} else {
	_player setVariable ["thisOwner", (owner _player)];
};
