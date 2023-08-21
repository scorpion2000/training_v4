params ["_scoreboard", "_trigger"];

_trigger setVariable ["scoreboard", _scoreboard];
_scoreboard setObjectTextureGlobal [0, '#(rgb,512,512,3)text(0,0,"EtelkaNarrowMediumPro",0.1,"#000000","#ff0000",Scoreboard)'];