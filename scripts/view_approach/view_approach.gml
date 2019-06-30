/// @description view_approach(x, y, width, height, speed, zoom_speed)
/// @param x
/// @param  y
/// @param  width
/// @param  height
/// @param  speed
/// @param  zoom_speed
var xx = argument0;
var yy = argument1;
var width = argument2;
var height = argument3;
var spd = argument4;
var zoom_spd = argument5;

// Move towards target
x = lerp(x, xx, spd);
y = lerp(y, yy, spd);

// Scale view
var w = lerp(camera_get_view_width(view_camera[0]), width, zoom_spd);
var h = lerp(camera_get_view_height(view_camera[0]), height, zoom_spd);
camera_set_view_size(view_camera[0], w, h);
