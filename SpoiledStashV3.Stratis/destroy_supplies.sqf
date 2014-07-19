_pos = _this select 0;
_target = _this select 1;

_target setDamage 1;bomb="M_Mo_120mm_AT_LG" createVehicle (_pos);sleep 0.3;bomb2="HelicopterExploSmall" createVehicle (_pos);sleep 0.2;bomb2="Bo_GBU12_LGB" createVehicle (_pos);sleep 1;bomb="M_Mo_120mm_AT_LG" createVehicle (_pos);deletevehicle _target;



END_TIME = END_TIME + bonus_time;
publicvariable "END_TIME";
hint format["Bonus Time added: %1 mikes",bonus_time/60];
sleep 7;
