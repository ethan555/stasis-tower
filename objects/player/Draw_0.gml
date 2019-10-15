/// @description Draw the player
var i;
// Draw the stasis field
if (stasis) {
    draw_set_color(c_white);
    draw_circle(stasis_x,stasis_y,10*(stasis_ammo/stasis_max),false);
    var s = -1, stasis_dir = point_direction(x,y,stasis_x,stasis_y);
    draw_primitive_begin(pr_linestrip);
    for (i = 0; i < sdist; i += random(3)+17) {
        s = -s;
        draw_vertex(x+lengthdir_x(i,stasis_dir)+lengthdir_x(random(10),stasis_dir+90*s),
            y+lengthdir_y(i,stasis_dir)+lengthdir_y(random(10),stasis_dir+90*s))
    }
    draw_vertex(stasis_x,stasis_y);
    draw_primitive_end();
}
// Draw self
draw_self();
// Draw the gun pointer
if (!gun_reload && gun_active) {
    var pointer_distance = range_finder(x,y,gun_angle,GUN_RANGE,wall,false,true);
    if (pointer_distance < 0) {pointer_distance = GUN_RANGE;}
    draw_set_color(c_red);
    var alpha = .5;
    draw_set_alpha(alpha);
    
    draw_primitive_begin(pr_linestrip);
    draw_vertex(x,y);
    if (pointer_distance > 100) {
        for (i = 100; i < pointer_distance && alpha > 0; i += 100) {
            draw_set_alpha(alpha);
            draw_vertex(x+lengthdir_x(i,gun_angle),y+lengthdir_y(i,gun_angle));
            alpha -= .05;
        }
    }
    draw_vertex(x+lengthdir_x(pointer_distance,gun_angle),y+lengthdir_y(pointer_distance,gun_angle));
    draw_primitive_end();
    
    draw_set_alpha(1);
}
//Draw gun
if (gun_active) {
    draw_sprite_ext(gun_sp,0,x-lengthdir_x(gun_kick,gun_angle),y-lengthdir_y(gun_kick,gun_angle),
        image_xscale,image_yscale,gun_angle,image_blend,image_alpha);
}
