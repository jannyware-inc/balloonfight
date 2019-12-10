//scr_hurtPlayer(typeofdmg)
//0 is normal player hurt
//1 is shock death

if(!global.player.dead){
	scr_playSound(snd_burst);
} else {
	return;
}
instance_create_depth(x,y,depth+1,obj_balloonpop);
switch(argument0){
	case 0:
		if(global.player.balloons > 1){
			global.player.balloons--;
		} else {
			global.player.balloons = 0;
			global.player.dead = true;
			global.player.fallTimer = global.player.fallTimerMax;
		}
		break;
	case 1:
		global.player.dead = true;
		global.player.fallTimer = global.player.fallTimerMax;
		global.player.shockTimer = global.player.shockTimerMax;
		break;
}