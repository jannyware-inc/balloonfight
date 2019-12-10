global.player = noone;

instance_destroy(obj_game);
global.game = instance_create_depth(0,0,-1000,obj_game);

room_goto(rm_fight2);