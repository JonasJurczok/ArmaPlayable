_Unit = _this select 0;
_myNearestEnemy = _this select 1;
_UnitGroup = group _Unit;
_GroupUnits = units _UnitGroup;
_Vehicle = (vehicle _Unit);
_CargoList = assignedCargo _Vehicle;
_CargoGroup = [];
//Hint format ["_CargoList %1",_CargoList];
if ((count _CargoList) <= 0) exitWith {};
_CargoListSelection = _CargoList call BIS_fnc_selectRandom;
_CargoGroup = group _CargoListSelection;
if (_Unit == (driver (vehicle _Unit))) then {_Unit doMove (getPos _myNearestEnemy)};

if ((_myNearestEnemy distance _Unit) < 400) then {
if ((getPos _Vehicle select 2) < 3) then {
if (_Unit in _CargoList) then {
unassignVehicle _Unit;
commandGetOut _Unit;
doGetOut _Unit;
_Unit action ["eject", _Vehicle];
(group _Unit) setBehaviour "COMBAT";
};
if (_Unit in (units _CargoGroup)) then {
unassignVehicle _Unit;
commandGetOut _Unit;
doGetOut _Unit;
_Unit action ["eject", _Vehicle];
(group _Unit) setBehaviour "COMBAT";
};
}
else
{
//(driver (vehicle _Unit)) setBehaviour "Careless"; // He stays relaxed, even if enemies are around
//(driver (vehicle _Unit)) setCombatMode "Blue"; // He won't attack anything, anymore 
//(driver (vehicle _Unit)) setCaptive true;
(driver (vehicle _Unit)) land "LAND";
_Vehicle land "LAND";
waitUntil {(getPos _Vehicle select 2) < 15;};
_Vehicle engineOn false;
waitUntil {(getPos _Vehicle select 2) < 1.5;};
{
unassignVehicle _x;
commandGetOut _x;
doGetOut _x;
_x action ["eject", _Vehicle];
(group _x) setBehaviour "COMBAT";
sleep 0.5;
} forEach (units _CargoGroup);
_Vehicle engineOn true;
(driver (vehicle _Unit)) setBehaviour "Aware";
(driver (vehicle _Unit)) setCombatMode "Red";
};
};

/*
if ((_myNearestEnemy distance _Groupleader) < 600) then {
if (_Unit in (crew (vehicle _Unit))) then {
if ((driver (vehicle _Unit)) != _Unit) then {
if ((gunner (vehicle _Unit)) != _Unit) then {
if ((commander (vehicle _Unit)) != _Unit) then {
commandGetOut _Groupleader;
unassignVehicle _Groupleader;
[_Groupleader] orderGetIn false;
commandGetOut _Unit;
doGetOut _Unit;
_Unit assignAsCargo objNull;
[_Unit] orderGetIn false;
unassignVehicle _Unit;
[_EnterVehicle] allowGetin false;
[_EnterVehicle] spawn {
sleep 60;
_EnterVehicle = _this select 0;
[_EnterVehicle] allowGetin true;
};

};
};
};
};
};
*/