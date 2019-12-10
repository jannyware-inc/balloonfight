if(keyboard_check_pressed(ord("P"))){
	dead = true;
}
if(keyboard_check_pressed(ord("O"))){
	balloons = 1;
}

if(!dead){
	xaxis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	if(nexthspd != 0){
		hspd = nexthspd;
		nexthspd = 0;
	}
	if(nextvspd != 0){
		vspd = nextvspd;
		nextvspd = 0;
	}

	if(flaptimer > 0){
		flaptimer--;
	}
	if(keyboard_check_pressed(vk_space)){
		scr_playSound(snd_flap);
		vspd += flapvspd;
		flaptimer = flaptimermax;
	
		if(xaxis != 0){
			sideFacing = xaxis;
			hspd += xaxis*(flaphspd+(flaphspddep * abs(hspd/maxhspd)));
		}
	}
	if(vspd >= 0 and place_meeting(x,y+1,obj_wall)){
		grounded = true;
	} else {
		grounded = false;
	}

	if(grounded){
		hspd += xaxis*runaccel;
		if (abs(hspd) < .1){
			hspd = 0;
		}
	}
	if(grounded and xaxis == 0){
		hspd *= groundaccel;
	}

	if(bbox_left<global.game.leftboundary){
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
	
	//physics
	vspd += grav;
	vspd = clamp(vspd,minvspd,maxvspd);
	hspd = clamp(hspd,-maxhspd,maxhspd);
} else {
	if(shockTimer > 0){
		shockTimer--;
	}
	if(fallTimer > 1){
		fallTimer--;
		hspd = 0;
		vspd = 0;
	} else if(fallTimer == 1){
		fallTimer--;
		vspd = fallInitialVspd;
	} else {
		vspd += grav;
		if(vspd > fallMaxVspd){
			vspd = fallMaxVspd;
		}
	}
}


if(!dead){
	var vwall = instance_place(x,y+vspd,obj_wall);
	if(vwall != noone){
		while(!place_meeting(x,y+sign(vspd),obj_wall)){
			y += sign(vspd);
		}
		if((vwall.y <= y)){
			nextvspd = !grounded * -vspd * bounceaccel;
		}
		vspd = 0;
	}
	y+=vspd;
	if(place_meeting(x+hspd,y,obj_wall)){
		while(!place_meeting(x+sign(hspd),y,obj_wall)){
			x += sign(hspd);
		}
		nexthspd = -hspd * bounceaccel;
		hspd = 0;
	}
	x+=hspd;
} else {
	y+=vspd;
	x+=hspd;
}
if(grounded){
	if(hspd == 0){
		if(xaxis != 0){
			sideFacing = xaxis;
		}
	} else {
		sideFacing = sign(hspd);
	}
} else if (xaxis != 0){
	sideFacing = sign(xaxis);
}

if(!spawnedSplash and y > global.game.bottomboundary){
	dead = true;
	spawnedSplash = true;
	scr_playSound(snd_splash);
	instance_create_depth(x,global.game.bottomboundary-20, depth-300,obj_splash);
}
//drawing
image_xscale = -sideFacing;
if(dead){
	if(shockTimer > 0){
		if(shockTimer %4 <3){
			image_index = 29;
		} else {
			image_index = 30;
		}
	} else {
		image_speed = 8;
		if(image_index < 30 or image_index > 32){
				image_index = 30;
		}
	}
} else if(balloons == 2){
	if(flaptimer > 0){
		image_speed = 12;
		if(image_index < 12 or image_index > 14.99){
			image_index = 12;
		}	
	} else if(grounded){
		if((hspd != 0 or xaxis != 0) and sign(hspd) == -sign(xaxis)){ //skid
			image_speed = 0;
			image_index = 25;
		} else if(xaxis == 0 and abs(hspd) < .1){ //stand
			image_speed = 1;
			if(image_index < 0 or image_index > 3){
				image_index = 0;
			}
		} else if (xaxis == 0){
			image_speed = 0;
			image_index = 24;
		} else { //run
			image_speed = 12 * abs(hspd/maxhspd);
			if(image_index < 6 or image_index > 8.99){
				image_index = 6;
			}
		}
	} else {
		image_speed = 1;
		if(image_index < 18 or image_index > 20.99){
			image_index = 18;
		}
	}
} else if (balloons == 1){
	if(flaptimer > 0){
		image_speed = 12;
		if(image_index < 15 or image_index > 17.99){
			image_index = 15;
		}	
	} else if(grounded){
		if((hspd != 0 or xaxis != 0) and sign(hspd) == -sign(xaxis)){ //skid
			image_speed = 0;
			image_index = 27;
		} else if(xaxis == 0 and abs(hspd) < .1){ //stand
			image_speed = 1;
			if(image_index < 3 or image_index > 5){
				image_index = 3;
			}
		} else if (xaxis == 0){
			image_speed = 0;
			image_index = 26;
		} else { //run
			image_speed = 12 * abs(hspd/maxhspd);
			if(image_index < 9 or image_index > 11.99){
				image_index = 9;
			}
		}
	} else {
		image_speed = 1;
		if(image_index < 21 or image_index > 23.99){
			image_index = 21;
		}
	}
}