if(nextvspd != 0){
	vspd = nextvspd;
	nextvspd = 0;
}
if(nexthspd != 0){
	hspd = nexthspd;
	nexthspd = 0;
}

if(dirgen){
	dirgen = false;
	vspd = lengthdir_y(spd,dir);
	hspd = lengthdir_x(spd,dir);
}

if(place_meeting(x,y,global.player)){
	scr_hurtPlayer(1);
	instance_destroy();
}

if(place_meeting(x,y+vspd,obj_wall)){
	while(!place_meeting(x,y+sign(vspd),obj_wall)){
		y += sign(vspd);
	}
	nextvspd = -vspd;
	vspd = 0;
}
y+=vspd;
if(place_meeting(x+hspd,y,obj_wall)){
	while(!place_meeting(x+sign(hspd),y,obj_wall)){
		x += sign(hspd);
	}
	nexthspd = -hspd;
	hspd = 0;
}
x+=hspd;
if(x < global.game.leftboundary){
	x = global.game.leftboundary;
	hspd = -hspd;
} else if(x > global.game.rightboundary){
	x = global.game.rightboundary;
	hspd = -hspd;
}

if(y > global.game.bottomboundary){
	instance_destroy();
}