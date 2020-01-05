/// @description gun_shoot()
/// Fires the player's gun

gun_kick = gun_kick_amount;
var angle = gun_angle + random_range(-gun_spread,gun_spread);
var gun_range = range_finder(x,y,angle,GUN_RANGE,collider,false,true);
if (gun_range < 0) {gun_range = GUN_RANGE;}
add_bullet(x,y,x+lengthdir_x(gun_range,angle),y+lengthdir_y(gun_range,angle),
    enemy, gun_damage);
gun_ammo --;
