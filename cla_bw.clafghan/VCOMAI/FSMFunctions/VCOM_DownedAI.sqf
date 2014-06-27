_Unit = _this select 0;
if (alive _Unit) then {
_UnitGroup = group _Unit;
_Unit setVariable ["DOWNED",1,false];
_Unit setVariable ["PERMADOWN",1,false];
_Unit setUnitPos "DOWN";
_Unit disableAI "MOVE";
_Unit disableAI "TARGET";
_Unit disableAI "AUTOTARGET";
_Unit setCaptive true;

unitanim103 = _Unit;
[[unitanim103,"AinjPpneMstpSnonWrflDnon_rolltoback"],"switchMoveEverywhere"] call BIS_fnc_MP;
sleep 4;
_animationlist = [
"acts_InjuredAngryRifle01",
"acts_InjuredCoughRifle02",
"acts_InjuredLookingRifle01",
"acts_InjuredLookingRifle02",
"acts_InjuredLookingRifle03",
"acts_InjuredLookingRifle04",
"acts_InjuredLookingRifle05",
"acts_InjuredLyingRifle01"
];
[_UnitGroup,_Unit] spawn {
_UnitGroup = _this select 0;
_Unit = _this select 1;
_Counter = 1;
while{_Counter == 1} do {
_Counter = (_Unit getVariable "PERMADOWN");
_ActualUnits = (units _UnitGroup) - [_Unit];
_Rescue = [_ActualUnits,_Unit] call BIS_fnc_nearestPosition;
sleep 0.01;
_Rescue doMove (getPos _Unit);
[_Rescue,_Unit] spawn {
_Rescue = _this select 0;
_Unit = _this select 1;
_Counter = 1;
while{_Counter == 1} do {
_Counter = (_Unit getVariable "PERMADOWN");
if ((_Rescue distance _Unit) < 2) then {
_Rescue action ["HealSoldier", _Unit];
_Counter = 0;
};
sleep 1;
};
};
if (!(alive _Unit)) exitWith {
_Unit setVariable ["PERMADOWN",0,false];
_Counter = 0;
}; 
sleep 15;
};
};
_Counter = 1;
while{_Counter == 1} do {
_Counter = (_Unit getVariable "PERMADOWN");
if (!(alive _Unit)) exitWith {
_Unit setVariable ["PERMADOWN",0,false];
unitanim105 = _Unit;
[[unitanim105,"AinjPpneMstpSnonWnonDnon_rolltofront"],"switchMoveEverywhere"] call BIS_fnc_MP;
_Counter = 0;
};


_RandomAnimation = _animationlist call BIS_fnc_selectRandom;
unitanim104 = _Unit;
RandomAnim = _RandomAnimation;
[[unitanim104,RandomAnim],"switchMoveEverywhere"] spawn BIS_fnc_MP;
	sleep 3;
};
if (!(alive _Unit)) exitWith {};
_Unit setUnitPos "DOWN";
_Unit enableAI "MOVE";
_Unit enableAI "TARGET";
_Unit enableAI "AUTOTARGET";
_Unit setCaptive false;
unitanim105 = _Unit;
[[unitanim105,"AinjPpneMstpSnonWrflDnon_rolltoback"],"switchMoveEverywhere"] call BIS_fnc_MP;
_Unit setUnitPos "DOWN";
sleep 2;
_Unit setUnitPos "AUTO";


};