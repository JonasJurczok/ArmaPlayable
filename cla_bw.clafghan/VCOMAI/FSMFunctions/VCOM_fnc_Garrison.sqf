_Unit = _this select 0;
_nBuilding = nearestBuilding _Unit;
if ((_nBuilding distance _Unit) > 200) exitWith {};
_GrabVariable = _Unit getVariable "GARRISONED";
if (isNil "_GrabVariable") exitWith {};
if (_GrabVariable == 1) exitWith {};
_Unit setVariable ["GARRISONED",1,false];
_bposleft = [];
_pcnt = 0;
while {format ["%1", _nBuilding buildingPos (_pcnt)] != "[0,0,0]" } do {
_bposleft set [count _bposleft, (_pcnt)];
_pcnt = _pcnt + 1;
};
_LocationArray = [];
{
_LocationArray = _LocationArray + [(_nBuilding buildingPos _x)];
} forEach _bposleft;
if (isNil "_LocationArray") exitWith {};
_group	= group _Unit;
_group_array = units _group;
//_GroupCount = count _group_array;

{[_x] joinSilent grpNull} forEach (units _group);
/*
_RandomUnit = _group_array call BIS_fnc_selectRandom;
_group_array = _group_array - [_RandomUnit];
*/

{
//Following if statement for getting AI to move / re-try garrison somewhere else if building is full.
if ((count _LocationArray) <= 0) then {
_CurrentPos = getPos _x;
_rnd = random 50;
_dist = (_rnd + 50);
_dir = random 360;
_positions = [(_CurrentPos select 0) + (sin _dir) * _dist, (_CurrentPos select 1) + (cos _dir) * _dist, 0];
_x doMove _positions;
[_x] spawn {
_Unit = _this select 0;
_Unit setVariable ["GARRISONED",0,false];
sleep (30 + (random 60));
_group	= group _Unit;
_waypoint0 = _group addwaypoint[(getpos _Unit),0];
_waypoint0 setwaypointtype "HOLD";
_waypoint0 setWaypointSpeed "FULL";
_waypoint0 setWaypointBehaviour "AWARE";
};
}
else
{
_AttackPoint = _LocationArray select floor(random(count _LocationArray));
_PortLocationArray = _LocationArray;
if (isNil "_AttackPoint") exitWith {};
_LocationArray = _LocationArray - [_AttackPoint];

_x doMove _AttackPoint;
_x commandMove _AttackPoint;
_x setVariable ["GARRISONED",1,false];
_randomarray = ["UP","Middle","UP","Middle","UP","Middle","UP","Middle","UP","Middle","UP","Middle","UP","Middle"];
_randomposition = _randomarray call BIS_fnc_selectRandom;
_x setUnitPos _randomposition;
[_x,_PortLocationArray] spawn {
_Unit = _this select 0;
_LocationArray = _this select 1;
_KeepLooping = 1;
while {_KeepLooping == 1;} do {
_GrabVariable = _Unit getVariable "GARRISONED";
if (isNil "_GrabVariable") exitWith {};
if (_GrabVariable == 0) exitWith {_KeepLooping = 0;};
if (!(alive _Unit)) exitWith {_KeepLooping = 0;};
sleep (30 + (random 120));
_AttackPoint = _LocationArray select floor(random(count _LocationArray));

_Unit doMove _AttackPoint;
_Unit commandMove _AttackPoint;
_randomarray = ["UP","Middle","UP","Middle","UP","Middle","UP","Middle","UP","Middle","UP","Middle","UP","Middle"];
_randomposition = _randomarray call BIS_fnc_selectRandom;
_Unit setUnitPos _randomposition;
};
};
sleep 1;
//AI will randomly reposition within a building
};
} forEach _group_array;