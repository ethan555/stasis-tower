/// @description Initialize variables
event_inherited();

#region Health variables
hp = 5;
#endregion

#region Movement variables
xspd = 0;
yspd = 0;
dir = 270;
sdir = 0;
sdist = 0;
#endregion

#region Stasis variables
stasis_active = true;
stasis = false;
stasis_max = 60;
stasis_ammo = stasis_max;
stasis_x = 0;
stasis_y = 0;
#endregion

#region Gun variables
gun_active = true;
gun_sprite = stasis_gun_sp;
gun_kick = 0;
gun_kick_amount = 3;
gun_max_ammo = 12;
gun_ammo = 12;
gun_reload = false;
gun_reload_speed = .25;
gun_angle = 0;
gun_spread = 2;
gun_damage = 1;
#endregion

#region Room variables
last_room = room;
door_number = -1;
#endregion
