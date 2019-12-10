//shader_set(nesmini);

draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,0,c_white,1);

draw_set_font(fnt_pixel);
draw_text(4,4, "Balloons: " + string(balloons));

/*
draw_sprite_ext(mask_index,0,round(x),round(y),image_xscale,image_yscale,0,c_white,1);
draw_sprite_ext(spr_balloonsmask2,0,round(x),round(y),image_xscale,image_yscale,0,c_white,1);

