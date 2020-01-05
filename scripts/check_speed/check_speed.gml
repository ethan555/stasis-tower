/// @description Ensure the directional speeds are safe

if (xspd != 0 || yspd != 0) {
	xspd = sign(xspd) * min(
		abs(lengthdir_x(TERMINAL,point_direction(0,0,xspd,yspd))),
		abs(xspd));
	yspd = sign(yspd) * min(
		abs(lengthdir_y(TERMINAL,point_direction(0,0,xspd,yspd))),
		abs(yspd));
}