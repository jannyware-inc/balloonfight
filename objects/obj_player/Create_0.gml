global.player = id;

maxhspd = 1.5;
minvspd = -1.5;
maxvspd = 1.5;
groundaccel = .8;
grav = .0375;
flapvspd = -1;
flaphspd = .4;
flaphspddep = .2;
sideFacing = 1;
balloons = 2;
runaccel = .1;
flaptimer = 0;
flaptimermax = 16;
bounceaccel = 0.75;



//boundaries
leftboundary = 0;
rightboundary = global.game.width;
bottomboundary = global.game.height+8;

fallTimerMax = 20;
fallTimer = 0;
fallInitialVspd = -.5;
fallMaxVspd = 3;

shockTimerMax = fallTimerMax;
shockTimer = 0;

spawnedSplash = false;
dead = false;

vspd = 0;
hspd = 0;
grounded = false;
wrapsurface = noone;
nexthspd = 0;
nextvspd = 0;
xaxis = 0;