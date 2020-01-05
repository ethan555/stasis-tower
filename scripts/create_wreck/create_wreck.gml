/// @description create_wreck create a wreck where I am.

var wreck = instance_create_depth(x,y,depth,wreckage);
with(wreck) {
    xspd = irandom_range(-10, 10);
    yspeed = irandom_range(-10, 0);
    sprite_index = other.sprite_index;
}

var num_sparks = irandom_range(3,7);
repeat(num_sparks) {
    var small_wreck = instance_create_depth(x,y,depth,small_wreckage);
}