//application_surface_draw_enable(false);

width = 256;
height = 240;

leftboundary = 0;
rightboundary = room_width;
bottomboundary = room_height;

enableCRTShader = false;

if(enableCRTShader){
	CRTController = instance_create_depth(x,y,0,obj_CRT_controller);
}
lastRoom = room;