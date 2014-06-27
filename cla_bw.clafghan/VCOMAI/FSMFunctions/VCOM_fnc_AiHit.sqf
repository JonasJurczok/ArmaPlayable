_Unit = _this select 0;
if (isPlayer _Unit) exitWith {};
if ((vehicle _Unit) != _Unit) exitWith {};
_Bodypart = _this select 1;
//_damage = _this select 2;
//_OldDamage = getDammage _Unit;
_Unit setUnitPosWeak "DOWN";
_AlreadyDown = _Unit getVariable "DOWNED2";
if (isNil "_AlreadyDown") exitWith {};
if (_AlreadyDown == 0) then {
_Stance = stance _Unit;
if (_Stance == "PRONE") exitWith {}; 
_Unit setVariable ["DOWNED2",1,false];
//Hint "RAN RAN!";
[_Unit] spawn {
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
};
};
if (_Bodypart == "Head") exitWith {
if (VCOM_AIHelmet == 1) then {
removeHeadgear _Unit;
};
};
if (_Bodypart == "Hands") exitWith {
_DestroyWeaponChance = random 100;
if (_DestroyWeaponChance <= 5) then {

};
};
if (_Bodypart == "Legs") exitWith {
/*
[_Unit] spawn {
_Unit = _this select 0;
_DestroyedLegs = random 100;
if (_DestroyedLegs <= 20) then {
while {alive _Unit} do {_Unit setUnitPos "DOWN";sleep 2;};
};
};
*/
};
/*
if (_Bodypart == "Body") exitWith {
_redamage = ( _damage / 0.90 );
_Unit setDamage (_OldDamage + _redamage);
};
*/