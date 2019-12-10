if(instance_exists(global.player)){
	if(global.player.dead and global.player.fallTimer <= 0){
		draw_set_halign(fa_center);
		draw_set_font(fnt_pixel);
		draw_text(width/2,height/2-16,"GAME OVER");
		draw_set_halign(fa_left);
	}
}