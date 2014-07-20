__player = _this select 0;
_joiner = _this select 1;

if !(_joiner) exitWith {};
waitUntil {!isNull _player};
if ((MISSION_START) && (JIP_DISABLED)) exitWith {hint "Mission already started, you cant join anymore. Sorry. You will be killed now."; _player setDamage 1;};

if (side _player == independent) then {
	_player setPos getMarkerPos "JIP_respawn_government";

	removeAllWeapons _player;
	_player addHeadgear 'H_HelmetIA_camo';
	_player addVest 'V_Rangemaster_belt';
	_player addUniform 'U_I_CombatUniform_tshirt';
	_player addMagazine ["30Rnd_556x45_Stanag", 3];
	_player addMagazine ["16Rnd_9x21_Mag", 3];
	_player addWeapon 'hgun_P07_F';
	_player addWeapon 'arifle_Mk20C_F';
	_player addPrimaryWeaponItem 'optic_Hamr';
	_player addPrimaryWeaponItem 'acc_flashlight';
	_player setFace 'WhiteHead_20';
	hint format ["get yourself a radio at the box. Last used frequency of your team is %1",current_frequency];
	
}
else 
{
	_player setPos getMarkerPos "JIP_respawn_opfor";

	removeAllWeapons _player;
	_player addHeadgear 'H_Bandanna_mcamo';
	_player addVest 'V_Rangemaster_belt';
	_player addUniform 'U_BG_leader';
	_player addMagazine ["30Rnd_556x45_Stanag", 3];
	_player addMagazine ["16Rnd_9x21_Mag", 3];
	_player addWeapon 'hgun_P07_F';
	_player addWeapon 'arifle_Mk20C_F';
	_player addPrimaryWeaponItem 'optic_Hamr';
	_player addPrimaryWeaponItem 'acc_flashlight';
	_player setFace 'WhiteHead_20';
	hint "Get yourself a radio at the box at your HQ";
};