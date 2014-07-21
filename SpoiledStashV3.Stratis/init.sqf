tf_no_auto_long_range_radio = true;
[] execVM "zlt_fieldrepair.sqf";

// set all Markers invisible for JIP ... make them visible on demand!

"mrkResistanceObjective1" setMarkerAlphaLocal 0;
"mrkResistanceObjective2" setMarkerAlphaLocal 0;
"mrkResistanceObjective3" setMarkerAlphaLocal 0;
"mrkResistanceStart" setMarkerAlphaLocal 0;
"mrkGovernmentStart" setMarkerAlphaLocal 0;
"mrkGovernmentAttack" setMarkerAlphaLocal 0; 
"mrkGovernmentStart" setMarkerAlphaLocal 0;
"mrkGovernmentText" setMarkerAlphaLocal 0;

[] execVM "manageMarkers.sqf";
[] execVM "set_unit_markers.sqf";

if (isServer) then {

SHOW_TIME = false;
publicVariable "SHOW_TIME";

CURRENT_FREQUENCY = "";
publicVariable "CURRENT_FREQUENCY";

MISSION_START = false;
publicVariable "MISSION_START";

BONUS_TIME = (paramsarray select 2);
publicVariable "BONUS_TIME";

HACKING_TIME = (paramsarray select 3);
publicVariable "HACKING_TIME";

JIP_DISABLED = (paramsarray select 4);
publicVariable "JIP_DISABLED";

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
waitUntil {MISSION_START};

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
{waitUntil {MISSION_START};
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