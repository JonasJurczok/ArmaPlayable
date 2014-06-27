_unit = (_this select 0) select 0;

//Hint format ["_unit %1",_unit];
_bullet = (_this select 0) select 6;
_TimeShot = _unit getVariable "FiredTime";
_SideUnit = side _unit;
if(_TimeShot == 0) then {
_unit setVariable ["FiredTime",1,true];
[_unit] spawn {
_unit = _this select 0;
sleep 4;
_unit setVariable ["FiredTime",0,true];
};
_hitPos = [0,0,0];
_done = false;
_pos = screenToWorld [0.5,0.5];
[_bullet,_pos,_unit,_SideUnit] spawn {
         _bullet = _this select 0;
        _pos = _this select 1;
		_unit = _this select 2;
		_SideUnit = _this select 3;
_previous = (_pos nearObjects ["#crater",20]) + (_pos nearObjects ["#crateronvehicle",20]) + (_pos nearObjects ["#explosion",20]);       
_time = 0;
while {alive _bullet || _time < 1;} do {sleep 0.1;_time = _time + 0.1;};
Hint "Moving on!";
_past =(_pos nearObjects ["#crater",20]) + (_pos nearObjects ["#crateronvehicle",20]) + (_pos nearObjects ["#explosion",20]);
_new = _past - _previous;
            _positions = [];
        
            {
            _positions set [(count _positions),getPosATL _x];
            }
			foreach _new;
        
        player sidechat format ["pos: %1",_positions];
        


_Array2 = allUnits;
_Array2 = _Array2 - [_unit];
{
if ((side _x) == _SideUnit) then {_Array2 = _Array2 - [_x]};
} forEach _Array2;
_Point = [];
//player sidechat format ["pos: %1",_positions];
//If ((count _positions) >= 1) then {_positions = (_positions select 0)};
If ((count _positions) >= 1) then {_Point = [_pos,_positions] call BIS_fnc_nearestPosition;player sidechat format ["_Point: %1",_Point];};
If ((count _positions) <= 0) exitWith {};
sleep 0.01;
if (isNil ("_Point")) exitWith {};
_ArrayCheck = typeName _Point;
if (_ArrayCheck == "ARRAY") exitWith {};
_UnitGroup = group _Point;

{

_CheckDistance = (_positions distance _x);
if ((_CheckDistance >= 46) && (_CheckDistance <= 70)) then {
_x setVariable["MOVINGTOCOVER",0,true];
};
if (_CheckDistance <= 45) then {
_x setVariable ["Suppressed",1,true];
};

if (_CheckDistance <= 20) then {
_x setVariable ["Suppressed",1,true];
_AnimationChance = (random 100);
if (_AnimationChance <= 20) then {
_LastAnimation = _x getVariable "ANIMSIDE";
if (_LastAnimation == 0) then {
_x setVariable ["ANIMSIDE",1,false];
_AlreadyDown = _x getVariable "DOWNED";
if (_AlreadyDown == 0) then {
//Hint "RAN RAN!";
[_x] spawn {
_Unit = _this select 0;
_AnimationList = ["AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright","AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft","AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright","AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft","AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright","AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft"];
_RandomAnimation = _AnimationList call BIS_fnc_selectRandom;
unitanim101 = _unit;
RandomAnim101 = _RandomAnimation;
[[unitanim101,RandomAnim101],"playMoveEverywhere"] call BIS_fnc_MP;
_Unit disableAI "ANIM";
sleep (1 + (random 10));
_Unit enableAI "ANIM";
//Hint "GET UP!";
unitanim101 = _unit;
[[unitanim101,"AadjPpneMstpSrasWrflDleft_AmovPpneMstpSrasWrflDnon"],"playMoveEverywhere"] call BIS_fnc_MP;
_Unit setUnitPos "AUTO";
sleep 5;
_Unit setVariable ["ANIMSIDE",0,false];
};
};
};
};
};


} forEach units _UnitGroup;

//Hint format ["_CheckDistance %1 _Point %2",_CheckDistance,_Point];

//if ((_CheckDistance >= 31) && (_CheckDistance <= 500)) then {_Unit setVariable["MOVINGTOCOVER",0,true];};
};
};








