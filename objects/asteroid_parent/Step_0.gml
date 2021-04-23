/// @description Float around
if (spd > 0) {
	spd = max(0, spd - FRICTION / weight);
	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	x += xspd;
	y += yspd;
}

image_angle += spin;
