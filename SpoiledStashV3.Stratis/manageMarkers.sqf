_isJIP = if (time > 0) then { true } else { false };
trackingPrecision = 20;

randomize_coord = {    
    _this + random(trackingPrecision * 2) - trackingPrecision
};

randomize_pos =
{
    private ["_randomizedPos", "_trueX", "_trueY"];
    
    _trueX = _this select 0;
    _trueY = _this select 1;
    
    _randomizedPos = [
         _trueX call randomize_coord,
        _trueY call randomize_coord,
        _this select 2
    ];
    
    _randomizedPos
};


if (!(side player == independent)) then {
"mrkResistanceObjective1" setMarkerAlphaLocal 1;
"mrkResistanceObjective2" setMarkerAlphaLocal 1;
"mrkResistanceObjective3" setMarkerAlphaLocal 1;
"mrkResistanceStart" setMarkerAlphaLocal 1;
"mrkResistanceObjective1" setMarkerPos (getPos supplies_south);
"mrkResistanceObjective2" setMarkerPos (getPos supplies_west);
"mrkResistanceObjective3" setMarkerPos (getPos supplies_north);
}
else {
"mrkGovernmentStart" setMarkerAlphaLocal 1;
"mrkGovernmentAttack" setMarkerAlphaLocal 1; 
"mrkGovernmentStart" setMarkerAlphaLocal 1;
"mrkGovernmentText" setMarkerAlphaLocal 1;
};

if (_isJIP) exitWith {};

_markerPos = (getPos supplies_south) call randomize_pos;
"cache_south" setMarkerPos _markerPos;
_markerPos = (getPos supplies_west) call randomize_pos;
"cache_west" setMarkerPos _markerPos;
_markerPos = (getPos supplies_north) call randomize_pos;
"cache_north" setMarkerPos _markerPos;
