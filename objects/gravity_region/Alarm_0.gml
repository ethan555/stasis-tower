/// @description Create gravity particle

var xx, yy;
xx = random_range(bbox_left,bbox_right);
yy = random_range(bbox_top,bbox_bottom);
instance_create_depth(xx,yy,depth,gravity_particle);
alarm[0] = random_range(particle_time_min, particle_time_max);

