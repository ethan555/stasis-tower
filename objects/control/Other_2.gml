/// @description Initialize game variables and persistent data objects
camera_create();
instance_create_depth(x,y,10,overlay);
instance_create_depth(x,y,0,input);
instance_create_depth(x,y,1,bullet_handler);
instance_create_depth(x,y,-10,particle_handler);
room_goto_next();