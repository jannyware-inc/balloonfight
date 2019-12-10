if(state == "state1"){
	if(state1Timer > 0){
		state1Timer--;
	} else {
		state = "state2";
	}
} else if(state == "state2"){
	if(state2Timer > 0){
		state2Timer--;
	} else {
		state = "state3";
	}
} else if(state == "state3"){
	if(state3Timer > 0){
		state3Timer--;
	} else {
		with(instance_create_depth(x,bbox_bottom*(image_yscale > 0) + bbox_top*(image_yscale < 0),depth,obj_spark)){
			if(other.image_yscale > 0){
				dir = 270 - 20*other.image_xscale;
			} else {
				dir = 90 + 20*other.image_xscale;
			}
		}
		instance_destroy();
	}
}

if(state == "state1"){
	image_index = 0;
} else if (state == "state2"){
	if(image_index < 1 or image_index > 2.99){
		image_index = 1;
	}
} else {
	if(image_index < 3 or image_index > 5.99){
		image_index = 3;
	}
}