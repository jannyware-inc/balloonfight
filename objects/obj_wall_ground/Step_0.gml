if(update){
	update = false;
	leftwall = instance_place(x-1,y,obj_wall);
	rightwall = instance_place(x+1,y,obj_wall);
	upwall = instance_place(x,y-1,obj_wall);
	downwall = instance_place(x,y+1,obj_wall);
	if(upwall != noone){
		sprite_index = spr_ground_bottom;
	} else if (downwall != noone){
		sprite_index = spr_ground_top;
	} else {
		sprite_index = spr_wall_float;
	}
	
	if(leftwall == noone){
		image_index = 0;
	} else if(rightwall == noone){
		image_index = 3;
	} else {
		image_index = 1 + id%2;
	}
}