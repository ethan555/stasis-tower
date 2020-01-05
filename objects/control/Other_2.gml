/// @description Initialize game variables and persistent data objects
view_camera[0] = camera_create();
display_set_gui_size(view_wport[0],view_hport[0]);
instance_create_depth(x,y,10,overlay);
instance_create_depth(x,y,0,input);
instance_create_depth(x,y,1,bullet_handler);
instance_create_depth(x,y,-10,particle_handler);
room_goto_next();