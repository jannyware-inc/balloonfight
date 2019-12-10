pumpTimerMax = 180;
pumpTimer = pumpTimerMax;
flapTimerMax = 180;
flapTimer = flapTimerMax;
floatTimerMax = 180;
floatTimer = floatTimerMax;

grav = .01;

enum enemystate {
	pump = 0,
	flap = 1,
	float = 2,
	fall = 3
}

state = enemystate.pump;

maxhspd = 3;

minvspd = -.5;
maxvspd = .65;

flaphspd = .03;
flapvspd = -.3;
flaphspdmax = 1;
bounceaccel = .8;

sideFacing = 1;

vspd = 0;
hspd = 0;

//boundaries
leftboundary = 0;
rightboundary = global.game.width;
bottomboundary = global.game.height+8;