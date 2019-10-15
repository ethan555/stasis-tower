/// @description Fall and roll
if (place_free(x, y+1)) {
    yspd = min(yspd+1, TERMINAL);
} else {
    if (xspd != 0) {
        xspd -= sign(xspd);
    }
}

smoke_index ++;
if (smoke_index >= smoke_rate) {
    add_particle(smoke,x+sprite_width/2,y+sprite_width/2,1);
    show_debug_message("Emitted smoek");
    smoke_index = 0;
}

if (lifespan > 0) {
    lifespan --;
} else {
    instance_destroy();
}