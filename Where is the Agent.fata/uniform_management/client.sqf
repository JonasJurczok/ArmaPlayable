/*uniform_management\client.sqf*/

if !(isDedicated) then {

  waitUntil { !IsNull Player };
      if (local player) then {
        
        waitUntil { time > 1 };

        switch (faction player) do {
               case "BLU_F":
               {
               [] call compile preprocessFile "uniform_management\loadout.sqf";};
               case "OPF_F":
               {
               [] call compile preprocessFile "uniform_management\loadout.sqf";};
               case "IND_F":
               {
               [] call compile preprocessFile "uniform_management\loadout_agents.sqf";};
               case "CIV_F":
               {
               [] call compile preprocessFile "uniform_management\loadout.sqf";};
              }; // left this in for possible later use, now all get the same equip on respawn
              

            switch (player) do {
            case p1: {[p1] call FNC_SL;};
            case p2: {[p2] call FNC_SL;};
            case p3: {[p3] call FNC_SL;};
            case p4: {[p4] call FNC_SL;};
            case p5: {[p5] call FNC_SL;};
            case p6: {[p6] call FNC_SL;};
            case p7: {[p7] call FNC_SL;};
            case p8: {[p8] call FNC_SL;};
            case officer: {[officer] call FNC_O1;};
            case officer2: if (o2_killed) then {[officer2] call FNC_O2;} else {[officer2] call FNC_O3;};
            };
       };

};  