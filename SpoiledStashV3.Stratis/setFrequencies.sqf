// v.1d by [STELS]Zealot
// Use from init.sqf:
// [] execVM "setFrequencies.sqf";







	if (isDedicated) exitWith {};

	//hint "wait until player is player";
	waituntil {player == player};
	//hint "... now player is player";
	
	

[] spawn 
{
	//hint "freq_check_spawn erfolgreich";
    _tfr_available = call TFAR_fnc_isTeamSpeakPluginEnabled; 
    if (isNil "_tfr_available") exitWith{
    //hint "_tfr_available is nil";
    }; 
    if (!_tfr_available) exitWith{
    //hint "_tfr_available is false";
    }; 
    if (!(side player == independent)) exitWith {
    //hint "player is not independent";
    };

    while {alive player} do {
        if ((TF_tangent_sw_pressed) || (TF_tangent_lr_pressed) || (TF_tangent_dd_pressed)) then {hint "DU FUNKST";
        _player_freq = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;
			if (isNil "_player_freq") then {hint "player freq is nil";sleep 1;} 
				else {
        		_markertext = str _player_freq;
        		current_frequency = _markertext;
        		publicVariable "current_frequency";
				//hint format["%1 is the totally awesome frequency",_markertext];
				//hint format["%1 is the totally awesome frequency2",current_frequency];
        		sleep 1;
        		};
        	
        }
    };
};




if (!(isServer)) exitWith {};

publicVariable "current_frequency";
