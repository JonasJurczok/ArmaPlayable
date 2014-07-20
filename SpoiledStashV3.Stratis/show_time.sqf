_duration = _this select 0;

SHOW_TIME = true;
publicVariable "SHOW_TIME";
sleep _duration;
SHOW_TIME = false;
publicVariable "SHOW_TIME";
hint "";