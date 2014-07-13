{_x setMarkerAlphaLocal 0} foreach ["civplace1"];
if (!(side player == independent)) then {

"mrkGovernmentStart" setMarkerAlphaLocal 0;
"mrkGovernmentAttack" setMarkerAlphaLocal 0; 
"mrkGovernmentStart" setMarkerAlphaLocal 0;
}
else {
"mrkResistanceObjective1" setMarkerAlphaLocal 0;;
"mrkResistanceObjective2" setMarkerAlphaLocal 0;;
"mrkResistanceObjective3" setMarkerAlphaLocal 0;;  
};
tf_no_auto_long_range_radio = true;
[] execVM "zlt_fieldrepair.sqf";

current_frequency = "";
publicvariable "current_frequency";

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