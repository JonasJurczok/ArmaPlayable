//AI will use artillery/mortars when possible. This script makes artillery AI fire at a certain position
//First hash 6/14/2014
_Unit = _this select 0;
_Enemy = _this select 1;

{
if (isNull _x) then {ArtilleryArray = ArtilleryArray - [_x];};
} foreach ArtilleryArray;

_Indsupport = [];
_Bluforsupport = [];
_Opforsupport = [];
_Chosen = [];
_ArtilleryUnits = [];
if (side _Unit == West) then {
{
if (side _x == West) then {_Bluforsupport = _Bluforsupport + [(vehicle _x)];};
} foreach ArtilleryArray;
_Chosen = _Bluforsupport;
};

if (side _Unit == East) then {
{
if (side _x == East) then {_Opforsupport = _Opforsupport + [(vehicle _x)];};
} foreach ArtilleryArray;
_Chosen = _Opforsupport;
};

if (side _Unit == Resistance) then {
{
if (side _x == Resistance) then {_Indsupport = _Indsupport + [(vehicle _x)];};
} foreach ArtilleryArray;
_Chosen = _Indsupport;
};

if ((count _Chosen) <= 0) exitWith {};

//player sidechat format ["ARTY CALLED: %1",(vehicle _Unit)];
_ReturnedSupport = [_Chosen,(vehicle _Unit)] call BIS_fnc_nearestPosition;
 if (typeName _ReturnedSupport == "ARRAY") exitWith {};
 
_AlreadyFiring = _ReturnedSupport getVariable "ISARTILLERY";
if (_AlreadyFiring == 0) exitWith {};
//player sidechat format ["ARTY _ReturnedSupport: %1",_ReturnedSupport];

_ArtilleryGroup = group _ReturnedSupport;
//player sidechat format ["ARTY _ArtilleryGroup: %1",_ArtilleryGroup];

_ArtilleryGroupUnits = units _ArtilleryGroup;
//player sidechat format ["ARTY _ArtilleryGroupUnits: %1",_ArtilleryGroupUnits];

{
_ArtilleryUnits = _ArtilleryUnits + [(vehicle _x)]; 
} foreach _ArtilleryGroupUnits;

_AmmoArray = getArtilleryAmmo _ArtilleryUnits;
//player sidechat format ["ARTY _AmmoArray: %1",_AmmoArray];
if (isNil "_AmmoArray") exitWith {};

_RandomAmmoArray = _AmmoArray call BIS_fnc_selectRandom;
//player sidechat format ["ARTY _RandomAmmoArray: %1",_RandomAmmoArray];
_ContinueFiring = (getPos _Enemy) inRangeOfArtillery [_ArtilleryUnits,_RandomAmmoArray];
if (!(_ContinueFiring)) exitWith {};
//Hint format ["_ArtilleryUnits : %1",_ArtilleryUnits];
{
_x setVariable ["ISARTILLERY",0,false];
_x doArtilleryFire [(getPos _Enemy),_RandomAmmoArray,(floor(random 4))];
//_x commandArtilleryFire [(getPos _Enemy),_RandomAmmoArray,(floor(random 4))];
} foreach _ArtilleryUnits;
{
[_x] spawn {
_Unit = _this select 0;
sleep 240;
_Unit setVariable ["ISARTILLERY",1,false];
};
} foreach _ArtilleryUnits;
