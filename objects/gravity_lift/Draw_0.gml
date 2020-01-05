/// @description Draw base of gravity lift

// Nine (three) slice

// Left side
draw_sprite_part(gravity_lift_sp,0,0,0,16,16,bbox_left,bbox_bottom - 16);
draw_sprite_part(gravity_lift_sp,0,32,0,16,16,bbox_right - 16,bbox_bottom - 16);
for (var i = 16; i < sprite_width - 16; i += 16) {
	draw_sprite_part(gravity_lift_sp,0,16,0,16,16,bbox_left + i,bbox_bottom - 16);
}
