/// @description initialize
event_inherited();

hp = 10;

gun_angle = image_angle;
gun_max_ammo = 3;
gun_ammo = 3;
gun_kick = 0;
gun_kick_amount = 30;
gun_spread = 5;
gun_damage = 1;
gun_reload = false;
gun_reload_speed = .25;
gun_type = GUN;
gun_active = true;

// Can see +- vision angle
vision_angle_range = 20;
vision_angle_to = gun_angle;
vision_timer = 60;
vision_timer_max = 60;
vision_speed = .25;

seen = false;

vision_angle_possible[0] = 0;
var j = 0, i;
for (i = 0; i < 8; i ++) {
    if (place_free(x+lengthdir_x(1,i*45),y+lengthdir_y(1,i*45))) {
        vision_angle_possible[j++] = i*45;
    }
}
vision_angle_possible_max = array_length_1d(vision_angle_possible)-1;

// Find all the corners of the walls
/*vision_angles = ds_list_create();
var num_walls = instance_number(wall), error = 4;
j = 0;
for (i = 0; i < num_walls; i ++) {
    var inst = instance_find(wall,i);
    if (inst != instance_id) {
        var x1 = inst.bbox_left - 1, y1 = inst.bbox_top - 1;
        var dist = point_distance(x,y,x1,y1);
        var dir = point_direction(x,y,x1,y1);
        //var range = range_finder(x,y,dir,GUN_RANGE,wall,false,true);
        if (collision_line(x,y,x1,y1,wall,false,true) == noone) {//abs(range - dist) <= error) {
            ds_list_add(vision_angles, dir);
            ds_list_add(vision_angles, dist);
        }
        x1 = inst.bbox_left - 1;
        y1 = inst.bbox_bottom + 1;
        dist = point_distance(x,y,x1,y1);
        dir = point_direction(x,y,x1,y1);
        //range = range_finder(x,y,dir,GUN_RANGE,wall,false,true);
        if (collision_line(x,y,x1,y1,wall,false,true) == noone) {//if (abs(range - dist) <= error) {
            ds_list_add(vision_angles, dir);
            ds_list_add(vision_angles, dist);
        }
        x1 = inst.bbox_right + 1;
        y1 = inst.bbox_bottom + 1;
        dist = point_distance(x,y,x1,y1);
        dir = point_direction(x,y,x1,y1);
        //range = range_finder(x,y,dir,GUN_RANGE,wall,false,true);
        if (collision_line(x,y,x1,y1,wall,false,true) == noone) {//if (abs(range - dist) <= error) {
            ds_list_add(vision_angles, dir);
            ds_list_add(vision_angles, dist);
        }
        x1 = inst.bbox_right + 1;
        y1 = inst.bbox_top - 1;
        dist = point_distance(x,y,x1,y1);
        dir = point_direction(x,y,x1,y1);
        //range = range_finder(x,y,dir,GUN_RANGE,wall,false,true);
        if (collision_line(x,y,x1,y1,wall,false,true) == noone) {//if (abs(range - dist) <= error) {
            ds_list_add(vision_angles, dir);
            ds_list_add(vision_angles, dist);
        }
    }
}
ds_list_sort(vision_angles,true);
