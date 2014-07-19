_isJIP = if (time > 0) then { true } else { false };
waitUntil {!isNull player};
if ((mission_start) && (jip_disabled)) exitWith {hint "Mission already started, you cant join anymore. Sorry. You will be killed now."; player setDamage 1;};

if (side player == independent) then {
	player setPos getMarkerPos "JIP_respawn_government";

	removeAllWeapons player;
	player addHeadgear 'H_HelmetIA_camo';
	player addVest 'V_Rangemaster_belt';
	player addUniform 'U_I_CombatUniform_tshirt';
	player addMagazine ["30Rnd_556x45_Stanag", 3];
	player addMagazine ["16Rnd_9x21_Mag", 3];
	player addWeapon 'hgun_P07_F';
	player addWeapon 'arifle_Mk20C_F';
	player addPrimaryWeaponItem 'optic_Hamr';
	player addPrimaryWeaponItem 'acc_flashlight';
	player setFace 'WhiteHead_20';
	hint "get yourself a radio at the box";
	
}
else 
{
	player setPos getMarkerPos "JIP_respawn_opfor";

	removeAllWeapons player;
	player addHeadgear 'H_Bandanna_mcamo';
	player addVest 'V_Rangemaster_belt';
	player addUniform 'U_BG_leader';
	player addMagazine ["30Rnd_556x45_Stanag", 3];
	player addMagazine ["16Rnd_9x21_Mag", 3];
	player addWeapon 'hgun_P07_F';
	player addWeapon 'arifle_Mk20C_F';
	player addPrimaryWeaponItem 'optic_Hamr';
	player addPrimaryWeaponItem 'acc_flashlight';
	player setFace 'WhiteHead_20';
	hint "get yourself a radio at the box";
};