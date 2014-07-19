//	
//
//	Init.sqf Eintrag
//	execVM "randomspawn.sqf";
//
//	Erleuterung:
//	- Script für 5 Positionen gedacht
//	- Name in dem Script "hostage2" ist aber Änderbar
//	- Script arbeitet mit Koordinaten
//	
//	You now have a random object postion just use the variable: _random_object_pos
//


if (!isServer) exitWith {};

private ["_pos1","_pos2","_pos3","_pos4","_pos5","_posarray","_random_object_pos"];

_pos1 = [5345.79,6003.32,6.2];
_pos2 = [5397.6,6109.39,0.2];
_pos3 = [5308.24,6169.83,4.2];
_pos4 = [5212.44,6172.91,0.2];
_pos5 = [5371.33,6251.96,0.2];


_posarray = [_pos1,_pos2,_pos3,_pos4,_pos5];

_random_object_pos = (_posarray select (floor(random(count _posarray))));

hostage2 setpos _random_object_pos;
