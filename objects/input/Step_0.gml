/// @description Take input

left = keyboard_check(l);
right = keyboard_check(r);
up = keyboard_check(u);
down = keyboard_check(d);

special = keyboard_check_pressed(spec);
interact = keyboard_check_pressed(use);
reload = keyboard_check_pressed(rel);
switch_alt = keyboard_check_pressed(tab);

mouse_left = mouse_check_button(m_l);
mouse_left_pressed = mouse_check_button_pressed(m_l);
mouse_right = mouse_check_button(m_r);
mouse_right_pressed = mouse_check_button_pressed(m_r);
switch_weapon_up = mouse_wheel_up();
switch_weapon_down = mouse_wheel_down();
