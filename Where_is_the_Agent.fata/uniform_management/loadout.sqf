/*uniform_management\loadout.sqf*/

FNC_SL = 
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