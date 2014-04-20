private "_time";
_time = _this select 0;

while {_time > 0} do {
    _time = _time - 60;  
        hintSilent parseText format["<t color='#ffa100'> Time Left %1</t>", [_time/(60*60)+.0001,"HH:MM:SS"] call BIS_fnc_timetostring];
    sleep 60;
}; 