///Ensure GUI layer is the correct size, same as the application surface.
display_set_gui_size(surface_width, surface_height);

///Check if the CRT shader is enabled and apply the effect to the application surface.
if (crt_shader_enabled) { scr_CRT_appy_to_surface(application_surface, view_camera[0]); }	
  else draw_surface(application_surface, 0,0);

///Set the cameras position if it has been moved with the arrow keys.
///Just for demonstration purposes, can be removed.
camera_set_view_pos(view_camera[0], _xx, _yy);

///Alter CRT variables and enable/disable settings.
///Just for demonstration purposes, can be removed.
/// re-enable the arrow keys if you want to try moving the view around, trust me. The shader works with views.
/*
if (keyboard_check(vk_left))           { _xx -= 0.5; }
if (keyboard_check(vk_right))          { _xx += 0.5; }
if (keyboard_check(vk_up))             { _yy -= 0.5; }
if (keyboard_check(vk_down))           { _yy += 0.5; }
*/


///Reset GUI layer back to the window size so we can draw text, etc.
display_set_gui_size(window_get_width(), window_get_height());
display_set_gui_maximise();