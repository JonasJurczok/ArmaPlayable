removeAllWeapons this;
this addHeadgear 'H_Watchcap_camo';
this addVest 'V_Rangemaster_belt';
this addUniform 'U_BG_Guerilla1_1';
this addWeapon 'arifle_Mk20_MRCO_F';
this addPrimaryWeaponItem 'optic_Hamr';
this addPrimaryWeaponItem 'acc_flashlight';
this addWeapon 'hgun_P07_F';
this setFace 'WhiteHead_18';





removeAllWeapons this;
this addHeadgear 'H_Shemag_olive_hs';
this addVest 'V_Rangemaster_belt';
this addUniform 'U_BG_leader';
this addWeapon 'arifle_Mk20C_F';
this addPrimaryWeaponItem 'optic_Hamr';
this addPrimaryWeaponItem 'acc_flashlight';
this addWeapon 'hgun_P07_F';
this setFace 'WhiteHead_21';




removeAllWeapons this;
this addHeadgear 'H_Shemag_olive_hs';
this addVest 'V_Rangemaster_belt';
this addUniform 'U_BG_Guerilla3_1';
this addWeapon 'arifle_Mk20C_F';
this addPrimaryWeaponItem 'optic_Hamr';
this addPrimaryWeaponItem 'acc_flashlight';
this addWeapon 'hgun_P07_F';
this setFace 'WhiteHead_17';


removeAllWeapons this;
this addHeadgear 'H_Bandanna_khk';
this addVest 'V_BandollierB_khk';
this addUniform 'U_BG_Guerilla3_1';
this addWeapon 'arifle_Mk20_GL_F';
this addPrimaryWeaponItem 'optic_Hamr';
this addPrimaryWeaponItem 'acc_flashlight';
this addWeapon 'hgun_ACPC2_F';
this setFace 'WhiteHead_13';


({((_x getVariable "AGM_Unconscious") == false) and (side _x == opfor)} count playableUnits) < 1;


({side _x == independent && (_x getVariable "AGM_Unconscious")} count playableUnits) < 1;

Error in expression <({((_x getVariable "AGM_Unconscious") == false) and (side _x == opfor)}count p>
  Error position: <== false) and (side _x == opfor)}count p>
  Error ==: Type Bool, expected Number,String,Object,Side,Group,Text,Config entry,Display (dialog),Control,Network Object,Team member,Task,Location
Error in expression <({((_x getVariable "AGM_Unconscious") == false) and (side _x == opfor)}count p>






if (alive s10) then {
removeAllWeapons s10;
s10 addHeadgear 'H_Bandanna_khk';
s10 addVest 'V_BandollierB_khk';
s10 addUniform 'U_BG_Guerilla3_1';
s10 addPrimaryWeaponItem 'optic_Hamr';
s10 addPrimaryWeaponItem 'acc_flashlight';
s10 setFace 'WhiteHead_13';
s10 addmagazines["30Rnd_556x45_Stanag", 6];
s10 addmagazines["30Rnd_9x21_Mag", 2];
s10 addWeapon 'arifle_Mk20_GL_F';
s10 addWeapon 'hgun_ACPC2_F';
s10 addItem "tf_anprc148jem_996";
s10 assignitem "tf_anprc148jem_996"; 
};

if (alive s11) then {
removeAllWeapons s11;
s11 addHeadgear 'H_Watchcap_camo';
s11 addVest 'V_Rangemaster_belt';
s11 addUniform 'U_BG_Guerilla1_1';
s11 addWeapon 'arifle_Mk20_MRCO_F';
s11 addPrimaryWeaponItem 'optic_Hamr';
s11 addPrimaryWeaponItem 'acc_flashlight';
s11 addWeapon 'hgun_P07_F';
s11 setFace 'WhiteHead_18';
s11 addmagazines["30Rnd_556x45_Stanag", 6];
s11 addmagazines["30Rnd_9x21_Mag", 2];
s11 addWeapon 'arifle_Mk20_GL_F';
s11 addWeapon 'hgun_ACPC2_F';
s11 addItem "tf_anprc148jem_997";
s11 assignitem "tf_anprc148jem_997"; 
};

if (alive s12) then {
removeAllWeapons s12;
s12 addHeadgear 'H_Shemag_olive_hs';
s12 addVest 'V_Rangemaster_belt';
s12 addUniform 'U_BG_leader';
s12 addWeapon 'arifle_Mk20C_F';
s12 addPrimaryWeaponItem 'optic_Hamr';
s12 addPrimaryWeaponItem 'acc_flashlight';
s12 addWeapon 'hgun_P07_F';
s12 setFace 'WhiteHead_21';
s12 addmagazines["30Rnd_556x45_Stanag", 6];
s12 addmagazines["30Rnd_9x21_Mag", 2];
s12 addWeapon 'arifle_Mk20_GL_F';
s12 addWeapon 'hgun_ACPC2_F';
s12 addItem "tf_anprc148jem_998";
s12 assignitem "tf_anprc148jem_998"; 
};

if (alive s13) then {
removeAllWeapons s13;
s13 addHeadgear 'H_Shemag_olive_hs';
s13 addVest 'V_Rangemaster_belt';
s13 addUniform 'U_BG_Guerilla3_1';   s13 addWeapon 'arifle_Mk20C_F';
s13 addPrimaryWeaponItem 'optic_Hamr';
s13 addPrimaryWeaponItem 'acc_flashlight';
s13 addWeapon 'hgun_P07_F';
s13 setFace 'WhiteHead_17';
s13 addmagazines["30Rnd_556x45_Stanag", 6];
s13 addmagazines["30Rnd_9x21_Mag", 2];
s13 addWeapon 'arifle_Mk20_GL_F';
s13 addWeapon 'hgun_ACPC2_F';
s13 addItem "tf_anprc148jem_999";
s13 assignitem "tf_anprc148jem_999";
};