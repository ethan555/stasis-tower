/// @description gun_shoot()
/// Fires the player's gun

gun_kick = gun_kick_amount;
var angle = gun_angle + random_range(-gun_kick_amount,gun_kick_amount);
var gun_range = range_finder(x,y,angle,GUN_RANGE,wall,false,true);
if (gun_range < 0) {gun_range = GUN_RANGE;}
add_bullet(x,y,x+lengthdir_x(gun_range,angle),y+lengthdir_y(gun_range,angle),
    enemy, 1);
gun_ammo --;
