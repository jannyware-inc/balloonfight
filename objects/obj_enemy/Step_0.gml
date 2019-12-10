if(state == enemystate.pump){
	if(pumpTimer > 0){
		pumpTimer--;
	} else {
		pumpTimer = pumpTimerMax;
		state = enemystate.flap;
	}
} else if (state == enemystate.flap){
	if(abs(hspd) < flaphspdmax or (abs(hspd) > flaphspdmax and sideFacing != sign(hspd))){
		hspd += flaphspd * sideFacing;
	}
	vspd += flapvspd;

	if(flapTimer > 0 and !place_meeting(x,y-1,obj_wall)){
		flapTimer--;
	} else {
		state = enemystate.float;
		flapTimer = flapTimerMax;
	}
} else if (state == enemystate.float){
	if(floatTimer > 0 and y < global.game.bottomboundary - 32){
		floatTimer--;
	} else {
		floatTimer = floatTimerMax;
		state = enemystate.flap;
	}
}

vspd += grav;
vspd = clamp(vspd,minvspd,maxvspd);
hspd = clamp(hspd,-maxhspd,maxhspd);

if(bbox_left < global.game.leftboundary){
	if(hspd > -1)
		hspd = -1;	
} else if(bbox_right > global.game.rightboundary){
	if(hspd < 1)
		hspd = 1;
}
	
if(x < global.game.leftboundary){
	x = global.game.rightboundary - abs(bbox_left - x);
} else if(x > global.game.rightboundary){
	x = global.game.leftboundary + abs(bbox_right - x);
}
var pre_y = y;
var vwall = instance_place(x,y+vspd,obj_wall);
var vplayer = place_meeting(x,y+vspd,global.player);
if(vwall != noone){
	while(vspd and !place_meeting(x,y+sign(vspd),obj_wall)){
		y += sign(vspd);
	}
	vspd = -vspd * bounceaccel;
}
y+=vspd;
var hplayer = place_meeting(x+hspd,pre_y,global.player);
if(place_meeting(x+hspd,y,obj_wall)){
	while(hspd and !place_meeting(x+sign(hspd),y,obj_wall)){
		x += sign(hspd);
	}
	hspd = -hspd * bounceaccel;
}
x+=hspd;

if(!global.player.dead and place_meeting(x,y,global.player)){
	var _hspd = global.player.hspd;
	var _vspd = global.player.vspd;
	var _pmag = point_distance(0,0,global.player.hspd,global.player.vspd);
	var _emag = point_distance(0,0,hspd,vspd);
	
	var _etopdir = point_direction(x,y,global.player.x,global.player.y);
	global.player.hspd = lengthdir_x(_emag,_etopdir);
	global.player.vspd = lengthdir_y(_emag,_etopdir);
	
	hspd = lengthdir_x(_pmag,_etopdir + 180);
	vspd = lengthdir_y(_pmag,_etopdir + 180);
	
	if(global.player.bbox_top > y-14){
		scr_hurtPlayer(0);
	}
}

image_xscale = -sideFacing;
if(state == enemystate.pump){
	image_speed = 1;
	if(image_index < 9 or image_index >= 11){
		image_index = 9;
	}
} else if (state == enemystate.flap){
	image_speed = 12;
	if(image_index < 3 or image_index >= 5){
		image_index = 3;
	}
} else if (state == enemystate.float){
	image_speed = 1;
	if(image_index < 0 or image_index >= 3){
		image_index = 3;
	}
}