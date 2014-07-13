if (side player == opfor || side player == civilian) then {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["FUCK! THE GOVERNMENT FORCES SUCCESSFULLY DESTROYED ALL WEAPON CACHES!", "PLAIN",30];
sleep 10;
endMission "LOSER";
} else
{
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
titleText ["YEAH! THE GOVERNMENT FORCES SUCCESSFULLY DESTROYED ALL WEAPON CACHES!", "PLAIN",30];
sleep 10;
endMission "END1";
};