/// @description Draw the player
var i, xx, yy;
xx = round(x);
yy = round(y);

#region Draw the stasis field
if (stasis) {
    draw_set_color(c_white);
    draw_circle(stasis_x,stasis_y,10*(stasis_ammo/stasis_max),false);
    var s = -1, stasis_dir = point_direction(xx,yy,stasis_x,stasis_y);
    draw_primitive_begin(pr_linestrip);
    for (i = 0; i < sdist; i += random(3)+17) {
        s = -s;
        draw_vertex(xx+lengthdir_x(i,stasis_dir)+lengthdir_x(random(10),stasis_dir+90*s),
            yy+lengthdir_y(i,stasis_dir)+lengthdir_y(random(10),stasis_dir+90*s))
    }
    draw_vertex(stasis_x,stasis_y);
    draw_primitive_end();
	
	draw_circle(stasis_x,stasis_y,sdist,true);
}
#endregion

// Draw self
draw_self();

#region Draw the gun pointer
if (!gun_reload && gun_active) {
    var pointer_distance = range_finder(xx,yy,gun_angle,GUN_RANGE,wall,false,true);
    if (pointer_distance < 0) {pointer_distance = GUN_RANGE;}
    draw_set_color(c_red);
    var alpha = .5;
    draw_set_alpha(alpha);
    
    draw_primitive_begin(pr_linestrip);
    draw_vertex(xx,yy);
    if (pointer_distance > 100) {
        for (i = 100; i < pointer_distance && alpha > 0; i += 100) {
            draw_set_alpha(alpha);
            draw_vertex(xx+lengthdir_x(i,gun_angle),yy+lengthdir_y(i,gun_angle));
            alpha -= .05;
        }
    }
    draw_vertex(xx+lengthdir_x(pointer_distance,gun_angle),yy+lengthdir_y(pointer_distance,gun_angle));
    draw_primitive_end();
    
    draw_set_alpha(1);
}
#endregion

#region Draw gun
if (gun_active) {
    var flip_y = 1;
    // Check if we are facing left or right
    if (abs(angle_difference(gun_angle,0)) > 90) {
        flip_y = -1;
    }
    // Draw
    draw_sprite_ext(gun_sprite,0,xx-lengthdir_x(gun_kick,gun_angle),yy-lengthdir_y(gun_kick,gun_angle),
        image_xscale,image_yscale * flip_y,gun_angle,image_blend,image_alpha);
}
#endregion
