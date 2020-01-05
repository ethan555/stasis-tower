/// @description Setup small wreck.

event_inherited();

lifespan = random_range(1,2) * 60;

smoke_type = smoke2;

gravity_amount = .1;

// Intended to go in all directions
yspd = random_range(-10, -1);
xspd = random_range(-10, 10);

// Bouncy!
physics_type = check_physics_bounce;
