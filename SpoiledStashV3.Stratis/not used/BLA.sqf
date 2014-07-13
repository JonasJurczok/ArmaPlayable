// v.1d by [STELS]Zealot
// Use from init.sqf:
// [] execVM "zlt_gen_freqs.sqf";

_markeast = [];
_markwest = [];
_markres = [];




zlt_fnc_createmarkerlocal = {
	private ["_marker","_pos","_shape","_type","_text","_color","_dir","_brush","_size"];
	_marker = [_this, 0, "mrk"] call BIS_fnc_param;
	_pos = [_this, 1, [0,0]] call BIS_fnc_param;
	_text = [_this, 2, ""] call BIS_fnc_param;
	_color = [_this, 3, "ColorOrange"] call BIS_fnc_param;
	_type = [_this, 4, "mil_dot"] call BIS_fnc_param;
	_size = [_this, 5, [1,1] ] call BIS_fnc_param;
	_shape = [_this, 6, "ICON"] call BIS_fnc_param;
	_dir = [_this, 7, 0] call BIS_fnc_param;
	_brush = [_this, 8, "Solid"] call BIS_fnc_param;

	createMarkerLocal[_marker, _pos];
	_marker setMarkerShapeLocal _shape;
	_marker setMarkerTypeLocal _type;
	_marker setMarkerTextLocal _text;
	_marker setMarkerColorLocal _color;
	_marker setMarkerDirLocal _dir;
	_marker setMarkerBrushlocal _brush;
	_marker setMarkerSizelocal _size;
	_marker setMarkerPosLocal _pos;
	_marker;
	
};

zlt_prc_freq_updmarkers = {

	_zlt_genfreq_xmap = 0;
	_zlt_genfreq_ymap = 8000;
	_zlt_genfreq_deltamap = 250;


	if (worldName == "Altis") then {
		_zlt_genfreq_xmap = 1000;
		_zlt_genfreq_ymap = 30000;
		_zlt_genfreq_deltamap = 500;
	};


	_zlt_spawnSetSwChannel = {
		[] spawn {
				waituntil {sleep 0.5;player call haveSwRadio};
				if (not isNil {zlt_genFreq_playerSwChannel}) then {
					[call activeSwRadio, zlt_genFreq_playerSwChannel ] call setSwFrequency;
				};
		};
	};
	
	
	_zlt_fnc_printfrq = {
	
		_val = _this select 1;
		_group = _this select 0;
		_side = _this select 2;
	
		_txt = format["%1: %2 MHz",_group, _val];
		_mcolor = [_side, true] call bis_fnc_sidecolor;
		
		[format ["mrk_freq_%1", _zlt_genfreq_ymap], [_zlt_genfreq_xmap, _zlt_genfreq_ymap]  , _txt  ,_mcolor]  call zlt_fnc_createmarkerlocal;
		_zlt_genfreq_ymap = _zlt_genfreq_ymap - _zlt_genfreq_deltamap;
		
	};

	if (isDedicated) exitWith {};
	waituntil {player == player};
	
	_friends = ([side player] call BIS_fnc_friendlySides) - [civilian];
	_friendsids = [];
	{_friendsids set [count _friendsids, [_x] call BIS_fnc_sideID] } foreach _friends;
	
	_playerSideId = _friends find playerSide;
	_playerGroupId = groupID group player;
	
	_lrside = _friends select 0;
	_mcolor = [side player, true] call bis_fnc_sidecolor;
	["mrk_freq_a", [_zlt_genfreq_xmap, _zlt_genfreq_ymap]  , "Frequencies:" ,_mcolor]  call zlt_fnc_createmarkerlocal;
	_zlt_genfreq_ymap = _zlt_genfreq_ymap - _zlt_genfreq_deltamap;
	
	_lrrecord = ( _this select (_friendsids select 0) ) select 0;
	[_lrrecord select 0, _lrrecord select 1,side player] call _zlt_fnc_printfrq;
	
	for "_x" from 0 to count(_friendsids)-1 do {
		_radioarr = _this select (_friendsids select _x);
		
		for "_y" from 1 to count(_radioarr)-1 do {
			_carr = _radioarr select _y;
			if ((_playerSideId == _x) and ([_playerGroupId,_carr select 0] call BIS_fnc_inString)) then {
				zlt_genFreq_playerSwChannel = str(_carr select 1);
				[] call _zlt_spawnSetSwChannel;
			};			
			[_carr select 0, _carr select 1,_friends select _x] call _zlt_fnc_printfrq;
		};
	};

};


if (not isDedicated) spawn {
	waitUntil {!isNil "public_frequency_markers"};
	public_frequency_markers call zlt_prc_freq_updmarkers;
};


_fnc_genfreq = {
	private ["_state","_num","_isinbl","_l1","_l2"];
	_state = _this select 0; 
	if (isNil {zlt_freqblacklist}) then {
		zlt_freqblacklist = [];
	};

	_num = 0;
	_l1 = -2;
	_l2 = 2;
	_isinbl = true;
	if (_state == 0) then {
		_l1 = 32; _l2 = 64;
	};
	if (_state == 1) then {
		_l1 = 100; _l2 = 400;
	};

	while {_isinbl} do {
		_num = round (([_l1,_l2] call bis_fnc_randomnum) * 10) / 10 ;
		if not (_num in zlt_freqblacklist) then {
			zlt_freqblacklist = zlt_freqblacklist set [count zlt_freqblacklist, _num ];
			_isinbl = false;
		};
	};
	_num;
};



if (not isServer) exitWith {};

_num = [0] call _fnc_genfreq ;
_sdv = [2] call _fnc_genfreq ;
_markeast set [count _markeast, ["LR", str(_num)+" ("+(if (_sdv >0) then {"+"} else {""})+str(_sdv)+")"]] ;

_num = [0] call _fnc_genfreq ;
_sdv = [2] call _fnc_genfreq ;
_markwest set [count _markwest,["LR", str(_num)+" ("+(if (_sdv >0) then {"+"} else {""})+str(_sdv)+")"]] ;

_num = [0] call _fnc_genfreq ;
_sdv = [2] call _fnc_genfreq ;
_markres set [count _markres, ["LR", str(_num)+" ("+(if (_sdv >0) then {"+"} else {""})+str(_sdv)+")"]] ;
	
	
{
	_num = [1] call _fnc_genfreq ;
	
	
	if ((leader _x) in playableUnits) then {
		switch true do {
			case (side leader _x == west) : {_markwest set [ count _markwest , [groupID (_x)+"("+name leader _x +")", _num ]];};
			case (side leader _x == east) : {_markeast set [ count _markeast , [groupID (_x)+"("+name leader _x +")", _num ]];};
			case (side leader _x == resistance) : {_markres set [ count _markres , [groupID (_x)+"("+name leader _x +")", _num ]];};
		
		
		
		};
	};

} foreach allgroups;

public_frequency_markers = [_markeast,_markwest,_markres];
publicVariable "public_frequency_markers";