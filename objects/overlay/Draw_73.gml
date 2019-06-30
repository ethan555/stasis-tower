/// @description 
with (wall) {
    draw_set_color(c_white);
    draw_rectangle(x-1,y-1,x+sprite_width+1,y+sprite_height+1,true);
}
with (wall) {
    draw_set_color(c_black);
    draw_rectangle(x,y,x+sprite_width,y+sprite_height,false);
}

var width = sprite_get_width(ledge_left_sp);
draw_set_alpha(.5);
if (width != sprite_width) {
    with (ledge) {
        var left = place_meeting(x-1,y,wall);
        var right = place_meeting(x+1,y,wall);
        
        draw_set_color(c_white);
        var xd1 = width;
        if (left) {xd1 = 0;}
        var xd2 = width;
        if (right) {xd2 = 0;}
        draw_rectangle(x+xd1,y,x+sprite_width-xd2,y+sprite_height,true);
    }
    with (ledge) {
        var left = place_meeting(x-1,y,wall);
        var right = place_meeting(x+1,y,wall);
        
        draw_set_color(c_black);
        draw_rectangle(x+xd1,y+1,x+sprite_width-xd2,y+sprite_height-1,false);
        if (!left) {draw_sprite(ledge_left_sp,0,x,y);}
        if (!right) {draw_sprite(ledge_right_sp,0,x+sprite_width,y);}
    }
}
draw_set_alpha(1);