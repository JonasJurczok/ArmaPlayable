tf_no_auto_long_range_radio = true;
[] execVM "zlt_fieldrepair.sqf";

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

_markerPos = (getPos supplies_south) call randomize_pos;
"cache_south" setMarkerPos _markerPos;
_markerPos = (getPos supplies_west) call randomize_pos;
"cache_west" setMarkerPos _markerPos;
_markerPos = (getPos supplies_north) call randomize_pos;
"cache_north" setMarkerPos _markerPos;

if (!(side player == independent)) then {
"mrkGovernmentStart" setMarkerAlphaLocal 0;
"mrkGovernmentAttack" setMarkerAlphaLocal 0; 
"mrkGovernmentStart" setMarkerAlphaLocal 0;
"mrkGovernmentText" setMarkerAlphaLocal 0;
"mrkResistanceObjective1" setMarkerPos (getPos supplies_south);
"mrkResistanceObjective2" setMarkerPos (getPos supplies_west);
"mrkResistanceObjective3" setMarkerPos (getPos supplies_north);
}
else {
"mrkResistanceObjective1" setMarkerAlphaLocal 0;
"mrkResistanceObjective2" setMarkerAlphaLocal 0;
"mrkResistanceObjective3" setMarkerAlphaLocal 0;
"mrkResistanceStart" setMarkerAlphaLocal 0;
};





if (isServer) then {

SHOW_TIME = false;
publicVariable "SHOW_TIME";

current_frequency = "";
publicVariable "current_frequency";

mission_start = false;
publicVariable "mission_start";

bonus_time = (paramsarray select 2);
publicVariable "bonus_time";

hacking_time = (paramsarray select 3);
publicVariable "hacking_time";

jip_disabled = (paramsarray select 4);
publicVariable "jip_disabled";

ELAPSED_TIME  = 0;

tickTime_ausgleich = 0;

// TIME MANAGEMENT
skiptime (((paramsarray select 0) - daytime + 24) % 24);
END_TIME = (paramsarray select 1); //When mission should end in seconds.
publicVariable "END_TIME";

};






titleCut ["", "BLACK FADED", 999]; 
    
[] Spawn { 

    sleep 1; 
    
    // Info text 
    [str ("Agia Marina"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText; 

    sleep 4; 
    "dynamicBlur" ppEffectEnable true;    
    "dynamicBlur" ppEffectAdjust [6];    
    "dynamicBlur" ppEffectCommit 0;      
    "dynamicBlur" ppEffectAdjust [0.0];   
    "dynamicBlur" ppEffectCommit 5;   

    titleCut ["", "BLACK IN", 2]; 
};



if (isServer) then {
waitUntil {mission_start};

    [] spawn 
    {
hint format ["Government is advancing.\nMission begins now. \nDuration is %1 mins",floor(END_TIME/60)];
                ELAPSED_TIME  = 0;
        START_TIME = diag_tickTime;
        while {ELAPSED_TIME < END_TIME} do 
        {
            ELAPSED_TIME = diag_tickTime - START_TIME;
            publicVariable "ELAPSED_TIME";
            sleep 1;
           
        };
    };
};


if !(isDedicated) then
{waitUntil {mission_start};
    [] spawn 
    {
    hint format ["Government is advancing.\nMission begins now. \nDuration is %1 mins",floor(END_TIME/60)];
    ELAPSED_TIME  = 0;
        while{ELAPSED_TIME < END_TIME } do
        {
            _time = END_TIME - ELAPSED_TIME;
            _finish_time_minutes = floor(_time / 60);
            _finish_time_seconds = floor(_time) - (60 * _finish_time_minutes);

            if(_finish_time_seconds < 10) then
            {
                _finish_time_seconds = format ["0%1", _finish_time_seconds];
            };
            if(_finish_time_minutes < 10) then
            {
                _finish_time_minutes = format ["0%1", _finish_time_minutes];
            };
            _formatted_time = format ["%1:%2 mins", _finish_time_minutes, _finish_time_seconds];
            

            if (SHOW_TIME) then {
                hintSilent format ["Time left:\n%1", _formatted_time];
            };
            

            sleep 1;
            
        };
    };
};  