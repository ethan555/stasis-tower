/// @description check_physics()

check_speed();

// Horizontal speed check
if (xspd != 0) {
    if (instance_place(x+xspd,y,collider)) {
        if (xspd > 0) {x = floor(x);}
        else {x = ceil(x);}
        //Find where to go and go there
        var i, xdir, abs_x;
        xdir = sign(xspd);
        abs_x = abs(xspd);
        for (i = 1; i <= abs_x; i ++) {
            if (!place_free(x+i*xdir,y)) {
                x += (i-1)*xdir;
                break;
            }
        }
        xspd = 0;
    }
    x += xspd;
}

// Vertical speed check
if (yspd != 0) {
    if (instance_place(x,y+yspd,collider) != noone) {
        if (yspd > 0) {y = floor(y); yspd = ceil(yspd);}
        else {y = ceil(y); yspd = floor(yspd);}
        //Find where to go and go there
        var i, ydir, abs_y;
        ydir = sign(yspd);
        abs_y = abs(yspd);
        for (i = 1; i <= abs_y; i ++) {
            if (!place_free(x,y+i*ydir)) {
                y += (i-1)*ydir;
                break;
            }
        }
        yspd = 0;
    } else {
        var l = instance_place(x,y+yspd,ledge)
        if (l != noone && bbox_bottom < l.bbox_top) {
            if (yspd > 0) {y = floor(y);}
            else {y = ceil(y);}
            //Find where to go and go there
            var i, ydir, abs_y;
            ydir = sign(yspd);
            abs_y = abs(yspd);
            for (i = 1; i <= abs_y; i ++) {
                if (!place_free(x,y+i*ydir)) {
                    y += (i-1)*ydir;
                    break;
                }
            }
            yspd = 0;
        }
    }
    y += yspd;
}
