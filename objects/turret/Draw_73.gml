/// @description Draw self

// Draw vision cone
/*
draw_set_color(c_red);
draw_set_alpha(.5);
draw_primitive_begin(pr_trianglelist);
draw_vertex(x,y);

var angle = gun_angle - vision_angle_range;
if (angle < 0) {angle += 360;}
var d = range_finder(x,y,angle,GUN_RANGE,wall,false,true);
if (d < 0) {
    d = GUN_RANGE;
}
draw_vertex(x+lengthdir_x(d,angle),y+lengthdir_y(d,angle));

var max_angle = gun_angle + vision_angle_range;
var diff = abs(angle_difference(max_angle,angle));
for (var i = 0, length = ds_list_size(vision_angles); i < length; i += 2) {
    draw_set_color(make_color_hsv(255*i/length,255,255));
    var a = vision_angles[| i];
    var dis = vision_angles[| i+1];
    var dif1 = abs(angle_difference(a,angle));
    var dif2 = abs(angle_difference(max_angle,a));
    show_debug_message("angle and a: " + string(angle_difference(angle,a)) + " " + string(i));
    show_debug_message("max angle and a: " + string(angle_difference(max_angle,a)));
    if (dif1 < diff && dif2 < diff) {
        // Draw directly to the points TODO do this better
        d = range_finder(x,y,a,GUN_RANGE,wall,false,true);
        if (d < 0) {d = GUN_RANGE;}
        draw_vertex(x+lengthdir_x(d,a),y+lengthdir_y(d,a));
        draw_vertex(x,y);
        draw_vertex(x+lengthdir_x(d,a),y+lengthdir_y(d,a));
    }// else {
            // We've gone too far!
            //break;
        //}
    //}
}

d = range_finder(x,y,max_angle,GUN_RANGE,wall,false,true);
if (d < 0) {d = GUN_RANGE;}
draw_vertex(x+lengthdir_x(d,max_angle),y+lengthdir_y(d,max_angle));

draw_primitive_end();
draw_set_alpha(1);
*/
// Draw self
draw_self();
draw_sprite_ext(gun_sp,0,x - lengthdir_x(gun_kick,gun_angle),y - lengthdir_y(gun_kick,gun_angle),
    image_xscale,image_yscale,gun_angle,image_blend,image_alpha);
