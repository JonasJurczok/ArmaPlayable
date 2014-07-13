if (side player == opfor) then {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["YEAH! WE KILLED ALL GOVERNMENT BITCHES!", "PLAIN",30];
sleep 10;
endMission "END1";
} else 
{
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["OH NO, THOSE TERRORISTS GOT US ALL.", "PLAIN",30];
sleep 10;
endMission "LOSER";
};