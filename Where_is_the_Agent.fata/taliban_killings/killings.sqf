SHK_DeadCivilianCount = 0;
SHK_DeadCivilianLimit = 3;
civsDead = false;

waituntil {!(isnil "bis_fnc_init")};

civ_groups=[];
civ_group_count = 0;

{if (count units _x>0 and side _x==east) then
	{civ_groups = civ_groups + [_x]}} 
forEach allGroups;

civ_group_count = count civ_groups ; 

//hintsilent format ["%1" + " opfor groups counted",civ_group_count];


[] spawn {
waituntil {civsDead};
sleep 5;


seitenwechsel = true;
hintsilent format ["They fire back now... Beware!",_this];

//HQ sideRadio "civsdeadsound";
		
		_i = 0;
		_wp = nil;
		while {_i < civ_group_count} do {
		
		//civ_group_count_helper = floor (civ_group_count);
		random_civ_group = civ_groups select _i;
		_i = _i+1;
		_wp = random_civ_group addWaypoint [base_attackpoint, 50];
		[_wp,1] setwaypointtype "MOVE";
		[_wp,1] setwaypointspeed "FULL";
		random_civ_group setCurrentWaypoint [_wp,1];
		//_markername = format["%1",_i];
		//_markername2 = format["%1_z",_i];
		//_markername = createMarker [_markername, getPos base_attackpoint]; _markername setMarkerShape "ICON"; _markername setMarkerType "SELECT"; _markername setMarkerColor "ColorRed"; _markername setMarkertextLocal "Waypoint of Opfor";
		//_leaderpos = getPos leader random_civ_group;
		//_markername2 = createMarker [_markername2, _leaderpos]; _markername2 setMarkerShape "ICON"; _markername2 setMarkerType "SELECT"; _markername2 setMarkerColor "ColorRed"; _markername2 setMarkertextLocal "Start of Opfor";
		sleep 2;
		}
};

SHK_fnc_deadCivilians = {
hintsilent format ["You killed %1 friendly takiban. Beware, they may shoot back.",_this];
if (_this >= SHK_DeadCivilianLimit) then {
civsDead = true;
publicvariable "civsDead";
};
};
SHK_eh_killed = {
 	_unit = _this select 0; 
 	_killer = _this select 1;  
    if (side _killer == EAST) exitWith {};
    if (side _killer == CIVILIAN) exitWith {};
    if (side _killer == sideEnemy) exitWith {};

	SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
	publicvariable "SHK_DeadCivilianCount";
	_killer addRating 1000;
	if isdedicated then {
		if (SHK_DeadCivilianCount >= SHK_DeadCivilianLimit) then {
		civsDead = true;
		publicvariable "civsDead";
		};
	} else {SHK_DeadCivilianCount call SHK_fnc_deadCivilians;};
};


waitUntil{!isNil "BIS_fnc_init"};
if isserver then {
	{
	if (side _x == EAST && _x iskindof "Man") then {
		_x addEventHandler ["killed", SHK_eh_killed];
		};
	} foreach allunits;
	officer removeEventHandler ["killed", SHK_eh_killed;
	officer2 removeEventHandler ["killed", SHK_eh_killed];

	
	officer2 addMPEventHandler ["MPRespawn", {_this execVM "onPlayerRespawn.sqf"}];
	
	//ind5 addEventHandler ["killed", SHK_eh_killed];
	//ind6 addEventHandler ["killed", SHK_eh_killed];
	//ind7 addEventHandler ["killed", SHK_eh_killed];
	//ind8 addEventHandler ["killed", SHK_eh_killed];
	//ind9 addEventHandler ["killed", SHK_eh_killed];
	//ind10 addEventHandler ["killed", SHK_eh_killed];
	//ind11 addEventHandler ["killed", SHK_eh_killed];
	//ind12 addEventHandler ["killed", SHK_eh_killed];


} else {
"SHK_DeadCivilianCount" addpublicvariableeventhandler { (_this select 1) call SHK_fnc_deadCivilians };
};