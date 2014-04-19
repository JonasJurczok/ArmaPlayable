_z = 0;
~5
#loop
if ((alive officer)) then {goto "loop"}; 

timer = 1800;  publicvariable "timer";

@!isnil "timer";
#loop1
z = z+1;
if (z == 60 || z == 120 || z == 180 || z == 240 || z == 300 || z == 360 || z == 420 || z == 480 || z == 540 || z == 600) then {
hintSilent parsetext format ["<t size='1.0' align='center'>%1</t>",(timer / 3600) call compile loadfile "time.sqf"];};

if (timer <= 20) then {playsound "ticking"};
timer = timer - 1; publicvariable "timer";
~5
if (timer >= 0) then {goto "loop1"};

timer = 0;

newvariable = true;
publicvariable "newvariable";
exit