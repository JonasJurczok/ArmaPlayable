/*uniform_management\loadout.sqf*/

FNC_O1 = 
{
  _unit = _this select 0;

removeallweapons _unit; 
removevest _unit; 
removeuniform _unit; 
removeheadgear _unit;
removeallassigneditems _unit;

sleep 1;

[[{}, _unit addUniform "U_CAF_AG_ME_FATIGUES_01"], "BIS_fnc_spawn", true] call BIS_fnc_MP; //attention to the syntax here. This, and only this syntax worked for me, even with other resources showing differently

_unit addHeadGear "H_CAF_AG_PAKTOL";
_unit addWeapon "ItemMap";
_unit addWeapon "ItemWatch";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemGPS";
_unit addWeapon "H_Shemag_khk";
_unit addWeapon "G_Spectacles";
_unit addWeapon "Binocular";
_unit addBackpack "B_TacticalPack_blk";
(backpackContainer _unit) addmagazinecargoGlobal ["CAF_30RND_545x39_AK",1];
_unit addWeapon "CAF_AK74";
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
(vestContainer _unit) addmagazinecargoGlobal ["CAF_30RND_545x39_AK",2];
clearItemCargoGlobal (uniformContainer _unit);
clearMagazineCargoGlobal (uniformContainer _unit);
clearWeaponCargoGlobal (uniformContainer _unit);
(uniformContainer _unit) addmagazinecargoGlobal ["CAF_30RND_545x39_AK",2];
_unit selectWeapon (primaryWeapon _unit);
};

FNC_O2 = 
{
  _unit = _this select 0;

removeallweapons _unit; 
removevest _unit; 
removeuniform _unit; 
removeheadgear _unit;
removeallassigneditems _unit;

sleep 1;

[[{}, _unit addUniform "U_CAF_AG_ME_ROBES_04a"], "BIS_fnc_spawn", true] call BIS_fnc_MP; //attention to the syntax here. This, and only this syntax worked for me, even with other resources showing differently

_unit addHeadGear "H_CAF_AG_TURBAN"
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

FNC_O3 = 
{
  _unit = _this select 0;

removeallweapons _unit; 
removevest _unit; 
removeuniform _unit; 
removeheadgear _unit;
removeallassigneditems _unit;

sleep 1;

[[{}, _unit addUniform "U_I_CombatUniform"], "BIS_fnc_spawn", true] call BIS_fnc_MP; //attention to the syntax here. This, and only this syntax worked for me, even with other resources showing differently
_unit addbackpack "B_AssaultPack_blk";  
_unit addheadgear "H_HelmetIA"; 
   
_unit addweapon "arifle_MX_GL_ACO_point_F";  
_unit addweapon "Binocular";
    
_unit addmagazine "100Rnd_65x39_caseless_mag"; 
_unit addmagazine "100Rnd_65x39_caseless_mag";  
_unit addmagazine "100Rnd_65x39_caseless_mag";  
 
_unit addmagazine "SmokeShell";  
_unit addmagazine "SmokeShell";  
_unit addmagazine "HandGrenade";  
_unit addmagazine "HandGrenade"; 
    
_unit addPrimaryWeaponItem "RH_compm4s";  
_unit addPrimaryWeaponItem "RH_SFM952V";
   
_unit additem "FirstAidKit";    
_unit additem "ItemMap";  
_unit assignitem "ItemMap";  
_unit additem "ItemGPS"; 
_unit assignitem "ItemGPS"; 
_unit additem "ItemCompass";  
_unit assignitem "ItemCompass";  
_unit additem "ItemWatch"; 
_unit assignitem "ItemWatch"; 

removegoggles _unit; 

_unit addmagazine "chemlight_blue"; 
_unit addmagazine "chemlight_yellow";
};

/*[...continues...]*/  