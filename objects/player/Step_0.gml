/// @description Take input and check physics

#region Get inputs
left = input.left;
right = input.right;
up = input.up;
down = input.down;

jump = input.jump;

special = input.special;
interact = input.interact;
reload = input.reload;
switch_alt = input.switch_alt;

mouse_left = input.mouse_left;
mouse_left_pressed = input.mouse_left_pressed;
mouse_right = input.mouse_right;
mouse_right_pressed = input.mouse_right_pressed;
switch_weapon_up = input.switch_weapon_up;
switch_weapon_down = input.switch_weapon_down;
#endregion

#region Check if stasis has been activated
if (mouse_right_pressed && stasis_active) {
    stasis = true;
    stasis_x = mouse_x;
    stasis_y = mouse_y;
    sdist = point_distance(x,y,stasis_x,stasis_y);
} else if (!mouse_right || stasis_ammo < 1) {
    stasis = false;
}
#endregion

#region Check if player should fall, or if not, is jumping
var l = instance_place(x,y+1,ledge);
var l_below = (l != noone && bbox_bottom < l.bbox_top);
if (jump && (instance_place(x,y+1,collider) || l_below)) {
    if (down && l_below) {
        y += 1;
    } else {
        yspd = -JUMPSPEED;
    }
}
#endregion

#region If stasis is on, orbit stasis point, otherwise move as normal
if (stasis == true) {
    //stasis_ammo --;
    var spd = point_distance(0,0,xspd,yspd);
    if (spd > 0) {
        dir = point_direction(0,0,xspd,yspd);
    } else {
        dir = 270;
    }
    
    if (sdist > 8) {
        var omega = radtodeg(spd/sdist);
        sdir = point_direction(stasis_x,stasis_y,x,y);
        var diff = angle_difference(dir,sdir);
        sdir = abs(dsin(diff))*sign(diff)*omega+sdir;
        xspd = -x + (stasis_x+lengthdir_x(sdist,sdir));
        yspd = -y + (stasis_y+lengthdir_y(sdist,sdir));
    } else {
        xspd = 0;
        yspd = 0;
        dir = 270;
    }
}
// If stasis is not on, move as normal
else {
    if (left || right && !(left && right)) {
        xspd = clamp(xspd + (-left + right) * WALKSPEED, -WALKSPEED, WALKSPEED);
    } else {
        var s = sign(xspd);
        xspd -= s;
        if (sign(xspd) != s) {
            xspd = 0;
        }
    }
    // Recharge stasis
    //stasis_ammo = min(stasis_ammo+1,stasis_max);
}
#endregion

#region Handle the gun
var xx, yy;
xx = round(x);
yy = round(y);
if (reload) {
    gun_ammo = 0;
    gun_reload = true;
}
gun_angle = point_direction(xx,yy,mouse_x,mouse_y);
if (gun_kick > 0) {
    gun_kick --;
} else {
    if (!gun_reload && gun_ammo > 0 && gun_active) {
        if (mouse_left) {
            gun_shoot();
        }
    } else {
        if (gun_reload) {
            if (gun_ammo < gun_max_ammo) {
                gun_ammo += gun_reload_speed;
            } else {
                gun_reload = false;
            }
        } else {
            gun_reload = true;
        }
    }
}
#endregion
