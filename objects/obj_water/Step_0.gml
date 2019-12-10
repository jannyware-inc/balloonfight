if(update){
	update = false;
	leftwater = instance_place(x-1,y,obj_water);
	rightwater = instance_place(x+1,y,obj_water);
	upwater = instance_place(x,y-1,obj_water);
	downwater = instance_place(x,y+1,obj_water);
	
	if(upwater == noone and !place_meeting(x,y-1,obj_wall)){
		sprite_index = spr_water_mid;
		drawTop = true;
	} else {
		drawTop = false;
		sprite_index = spr_water_mid;
	}
	image_index = id%4;
}