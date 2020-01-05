/// @description Draw the player stats

var window_height = display_get_gui_height();

#region Draw gun crosshairs
draw_sprite(crosshairs_sp,0,mouse_x,mouse_y);
#endregion

draw_set_alpha(.5);
#region Draw ammo
if (gun_active) {
    draw_set_color(c_white);
    var i = 0, sprite_size = 2;
    for (i = 0; i < gun_ammo; i ++) {
        draw_sprite_ext(ammo_sp,0,33,window_height-11-(i*(sprite_get_height(ammo_sp)*sprite_size + sprite_size)),
            sprite_size, sprite_size, 0, c_white, 1);
    }
}
#endregion

#region Draw stasis bar
if (stasis_active) {
    if (!stasis) {draw_set_color(c_gray);}
    var bar_width = 20;
    var bar_height_multiplier = 4;
    draw_rectangle(10, window_height-10,
        10+bar_width, window_height-10-stasis_max*bar_height_multiplier,true);
    draw_rectangle(10, window_height-10,
        10+bar_width, window_height-10-stasis_ammo*bar_height_multiplier,false);
}
#endregion
//Don't forget to reset the alpha
draw_set_alpha(1);
