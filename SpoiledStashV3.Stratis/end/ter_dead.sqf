if (side player == opfor || side player == civilian) then {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["FUCK! THE GOVERNMENT FORCES KILLED ALL RESISTANCE!", "PLAIN",30];
sleep 10;
endMission "LOSER";
} else {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["OH YES, WE KILLED ALL THOSE BASTARDS.", "PLAIN",30];
sleep 10;
endMission "END1";
};