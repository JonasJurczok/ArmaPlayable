if (side player == opfor || side player == civilian) then {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["YES! WE SURVIVED THE MISSION TIME LIMIT.", "PLAIN",30];
sleep 10;
endMission "END1";
} else
{
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["OH NO. TIME HAS SLIPPED THROUGH OUR FINGERS...", "PLAIN",30];
sleep 10;
endMission "LOSER";
};