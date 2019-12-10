if(state == "countdown"){
	if(!instance_exists(spark1) or !instance_exists(spark2)){
		if(stormTimer > 0){
			stormTimer--;
		} else {
			state = "lightning";
			stormTimer = stormTimerMax;
		}
	} else {
		stormTimer = stormTimerMax
	}
} else if (state == "lightning"){
	if(lightningTimer > 0){
		lightningTimer--;
	} else {
		switch(boltdir%4){
			case 0:
				with(instance_create_depth(bbox_right-5,bbox_top+5,depth+1,obj_lightning)){
					image_yscale = -1;
					image_xscale = -1;
				}
			break;
			case 1:
				with(instance_create_depth(bbox_left+5,bbox_top+5,depth+1,obj_lightning)){
					image_yscale = -1;
				}
			break;
			case 2:
				with(instance_create_depth(bbox_left+5,bbox_bottom-5,depth+1,obj_lightning)){
					image_xscale = 1;
				}
			break;
			case 3:
				with(instance_create_depth(bbox_right-5,bbox_bottom-5,depth+1,obj_lightning)){
					image_xscale = -1;
				}
			break;
		}
		boltdir++;
		lightningTimer = lightningTimerMax;
		state = "countdown";
	}
}

if(state == "countdown"){
	image_index = 0;
} else {
	if(lightningTimer%4<3){
		image_index = 1;
	} else {
		image_index = 0;
	}
}