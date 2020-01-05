/// @description aim and shoot

// If we are dead, die
if (hp <= 0) {
    create_wreck();
    instance_destroy();
    return;
}

if (!seen) {
    if (gun_angle == vision_angle_to) {
        vision_timer --;
        if (vision_timer <= 0) {
            // Look at something else
            vision_angle_to = vision_angle_possible[irandom(vision_angle_possible_max)]
                + irandom(vision_angle_range);
            vision_timer = vision_timer_max;
        }
    } else {
        gun_angle += sign(angle_difference(vision_angle_to,gun_angle));
        if (abs(angle_difference(gun_angle,vision_angle_to)) < 1) {
            gun_angle = vision_angle_to;
        }
    }
} else {
    // Make sure we can still see them
    if (collision_line(x,y,player.x,player.y,wall,false,true) != noone) {
        vision_angle_to = point_direction(x,y,player.x,player.y);
    }
    // We can't see them? TODO add other points to check
    else {
        seen = false;
        vision_timer = vision_timer_max;
    }
}

// Handle the gun
if (seen) {
    if (gun_angle != vision_angle_to) {
        gun_angle = lerp(gun_angle,vision_angle_to,vision_speed);
    }
    if (angle_difference(gun_angle, vision_angle_to) <= 10) {
        if (gun_kick > 0) {
            gun_kick --;
        } else {
            if (!gun_reload && gun_ammo > 0 && gun_active) {
                if (angle_difference(gun_angle, vision_angle_to) <= 10) {
                    shoot_weapon(gun_type);
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
    }
}
