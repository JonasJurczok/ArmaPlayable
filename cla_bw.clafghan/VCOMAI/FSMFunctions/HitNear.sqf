_unit = (_this select 0) select 0;

//Hint format ["_unit %1",_unit];
_bullet = (_this select 0) select 6;
_TimeShot = _unit getVariable "FiredTime";
_SideUnit = side _unit;
if(_TimeShot == 0) then {
_unit setVariable ["FiredTime",1,true];
[_unit] spawn {
_unit = _this select 0;
sleep 10;
_unit setVariable ["FiredTime",0,true];
};

_pos = cursorTarget;
if (isNull _pos) then {
//Remember, screenToWorld is using UI coordinates! 
_pos = screenToWorld [0.5,0.5];
}
else
{
_pos = getPosATL _pos;
};


_Array2 = allUnits;
_Array2 = _Array2 - [_unit];
{
if ((side _x) == _SideUnit) then {_Array2 = _Array2 - [_x]};
} forEach _Array2;       
//player sidechat format ["_pos: %1",_pos];
        



//player sidechat format ["_Array2: %1",_Array2];
_Point = [];

_Point = [_Array2,_pos] call BIS_fnc_nearestPosition;
//player sidechat format ["_Point: %1",_Point];
if (isNil ("_Point")) exitWith {};
_ArrayCheck = typeName _Point;
if (_ArrayCheck == "ARRAY") exitWith {};
_UnitGroup = group _Point;

{

_CheckDistance = (_pos distance _x);
if ((_CheckDistance >= 46) && (_CheckDistance <= 70)) then {
_x setVariable["MOVINGTOCOVER",0,true];
};
if (_CheckDistance <= 25) then {
_x setVariable ["Suppressed",1,true];
};

if (_CheckDistance <= 10) then {
if ((vehicle _x) != _x) exitWith {};
if (isPlayer _x) exitWith {};
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
_Unit disableAI "MOVE";
sleep (1 + (random 10));
_Unit enableAI "ANIM";
_Unit enableAI "MOVE";
//Hint "GET UP!";
unitanim101 = _unit;
[[unitanim101,"AadjPpneMstpSrasWrflDleft_AmovPpneMstpSrasWrflDnon"],"playMoveEverywhere"] call BIS_fnc_MP;
_Unit setUnitPos "AUTO";
sleep 30;
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








