/// @description Fall and roll
if (place_free(x, y+1)) {
    yspd = min(yspd+GRAVITY*gravity_amount, TERMINAL);
} else {
    if (xspd != 0) {
        xspd -= sign(xspd);
    }
}

smoke_index ++;
if (smoke_index >= smoke_rate) {
    add_particle(smoke_type,x,y,1);
    smoke_index = 0;
}

if (lifespan > 0) {
    lifespan --;
} else {
    instance_destroy();
}