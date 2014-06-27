{_x setMarkerAlphaLocal 0} foreach ["civplace1","civplace2","civplace3","civplace4"];
[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};
[] execVM "VCOMAI\init.sqf";
tf_no_auto_long_range_radio = true;
[] execVM "zlt_fieldrepair.sqf";
[] execVM "spect\specta_init.sqf";