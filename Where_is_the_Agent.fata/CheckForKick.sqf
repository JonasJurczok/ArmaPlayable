_time = call publictime;
_player = this select 1;

if (_time > 1 && (side player) == CIVILIAN) then {

if (serverCommandAvailable "#shutdown") exitWith {
	hint format ["Welcome %1!\nYou logged in, no kick", GVAR(name_pl)];
};

hint "JIP for this slot is not possible!\nYou have 10 seconds to log in or you get kicked automatically!";

sleep 10;

if (serverCommandAvailable "#shutdown") exitWith {
	hint format ["Welcome %1!\nYou logged in, no kick", GVAR(name_pl)];
};

hint "You will be kicked now... !!!";

sleep 2;

serverCommand Format["#kick %1",_name];
}