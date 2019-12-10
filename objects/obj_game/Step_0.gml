if(room != lastRoom){
	show_debug_message("room change");
	scr_room_set_size(room_width,room_height);
	rightboundary = room_width;
	bottomboundary = room_height;
	leftboundary = 0;
	with(instance_create_depth(0,y-16,0,obj_wall)){
		image_xscale = other.rightboundary/16;
	}
	if(enableCRTShader){
		instance_destroy(CRTController);
		CRTController = instance_create_depth(x,y,0,obj_CRT_controller);
	}
}
lastRoom = room;