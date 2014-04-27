//hintsilent format ["onplayerrespawn sqf"];
private["_unit","_oldunit","_respawn","_respawndelay"];
_unit = _this select 0;

if (_unit != officer2) exitWith{};

if (firstspawn == 0) exitWith {
firstspawn = firstspawn + 1;
publicvariable "firstspawn";

removeallweapons _unit; 
removevest _unit; 
removeuniform _unit; 
removeheadgear _unit;
removeallassigneditems _unit;

sleep 1;

[[{}, _unit addUniform "U_CAF_AG_ME_ROBES_04a"], "BIS_fnc_spawn", true] call BIS_fnc_MP; //attention to the syntax here. This, and only this syntax worked for me, even with other resources showing differently

_unit addHeadGear "H_CAF_AG_TURBAN";
_unit addWeapon "ItemMap";
_unit addWeapon "ItemWatch";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemGPS";
_unit addWeapon "H_Shemag_khk";
_unit addWeapon "G_Spectacles";
_unit addWeapon "Binocular";
_unit addBackpack "B_TacticalPack_blk";
(backpackContainer _unit) addmagazinecargoGlobal ["CAF_10RND_762X54_SVD",1];
_unit addWeapon "CAF_SVD";
_unit addBackpack "B_TacticalPack_blk";
(backpackContainer _unit) addmagazinecargoGlobal ["6Rnd_45ACP_Cylinder",1];
_unit addWeapon "hgun_Pistol_heavy_02_F";
clearItemCargoGlobal (backpackContainer _unit);
clearMagazineCargoGlobal (backpackContainer _unit);
clearWeaponCargoGlobal (backpackContainer _unit);
(backpackContainer _unit) addmagazinecargoGlobal ["1Rnd_HE_Grenade_shell",4];
clearItemCargoGlobal (vestContainer _unit);
clearMagazineCargoGlobal (vestContainer _unit);
clearWeaponCargoGlobal (vestContainer _unit);
(vestContainer _unit) addmagazinecargoGlobal ["CAF_10RND_762X54_SVD",2];
clearItemCargoGlobal (uniformContainer _unit);
clearMagazineCargoGlobal (uniformContainer _unit);
clearWeaponCargoGlobal (uniformContainer _unit);
(uniformContainer _unit) addmagazinecargoGlobal ["CAF_10RND_762X54_SVD",2];
_unit selectWeapon (primaryWeapon _unit);
};

if (firstspawn == 1) exitWith{
//hintsilent format ["seitenwechsel ist %1 ", seitenwechsel];
	if (seitenwechsel) then {
	[_unit] joinsilent grp_blufor2;
	//hintsilent format ["joinsilent grp_blufor2"];
	}
	else 
	{
	[_unit] joinsilent grp_aaf;
	//hintsilent format ["joinsilent aaf"];
};
//hintsilent format ["seitenwechsel..removing all gear"];
	removeallweapons _unit;
	removevest _unit;
	removeuniform _unit;
	removeheadgear _unit;
	removeallassigneditems _unit;
	//hintsilent format ["removed everything"];
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 0; // time till vision is fully blurred
cutText ["Your mind feels dizzy... you dreamed you would be an agent. But you are not!", "BLACK FADED"];
	sleep 0.5;

[[{}, _unit addUniform "U_B_CombatUniform_mcam"], "BIS_fnc_spawn", true] call BIS_fnc_MP; //attention to the syntax here. This, and only this syntax worked for me, even with other resources showing differently
_unit addbackpack "B_AssaultPack_blk";  
_unit addheadgear "H_HelmetB_paint"; 

_unit addweapon "arifle_MX_F";  
_unit addweapon "Binocular";
    
_unit addmagazine "30Rnd_65x39_Caseless_mag"; 
_unit addmagazine "30Rnd_65x39_Caseless_mag";  
_unit addmagazine "30Rnd_65x39_Caseless_mag";  
 
_unit addmagazine "SmokeShell";  
_unit addmagazine "SmokeShell";  
_unit addmagazine "HandGrenade";  
_unit addmagazine "HandGrenade"; 
 
   
_unit additem "FirstAidKit";
_unit additem "ItemMap";
_unit assignitem "ItemMap";
_unit additem "ItemGPS";
_unit assignitem "ItemGPS";
_unit additem "ItemCompass";
_unit assignitem "ItemCompass";
_unit additem "ItemWatch";
_unit assignitem "ItemWatch";

_unit addmagazine "chemlight_blue";
_unit addmagazine "chemlight_yellow";

firstspawn = firstspawn + 1;
publicvariable "firstspawn";

sleep 5;
titleCut ["", "BLACK IN", 3];
"dynamicBlur" ppEffectAdjust [0]; // intensity of blur
"dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
sleep 5;
"dynamicBlur" ppEffectEnable false; // disables ppeffect
};

	

	//hintsilent format ["seitenwechsel..removing all gear"];
	removeallweapons _unit;
	removevest _unit;
	removeuniform _unit;
	removeheadgear _unit;
	removeallassigneditems _unit;
	//hintsilent format ["removed everything"];

	sleep 1;

[[{}, _unit addUniform "U_B_CombatUniform_mcam"], "BIS_fnc_spawn", true] call BIS_fnc_MP; //attention to the syntax here. This, and only this syntax worked for me, even with other resources showing differently
_unit addbackpack "B_AssaultPack_blk";  
_unit addheadgear "H_HelmetB_paint"; 

_unit addweapon "arifle_MX_F";  
_unit addweapon "Binocular";
    
_unit addmagazine "30Rnd_65x39_Caseless_mag"; 
_unit addmagazine "30Rnd_65x39_Caseless_mag";  
_unit addmagazine "30Rnd_65x39_Caseless_mag";  
 
_unit addmagazine "SmokeShell";  
_unit addmagazine "SmokeShell";  
_unit addmagazine "HandGrenade";  
_unit addmagazine "HandGrenade"; 
 
   
_unit additem "FirstAidKit";
_unit additem "ItemMap";
_unit assignitem "ItemMap";
_unit additem "ItemGPS";
_unit assignitem "ItemGPS";
_unit additem "ItemCompass";
_unit assignitem "ItemCompass";
_unit additem "ItemWatch";
_unit assignitem "ItemWatch";

_unit addmagazine "chemlight_blue";
_unit addmagazine "chemlight_yellow";