/// @description Move

if (spd > 0) {
	x += lengthdir_x(spd,dir);
	y += lengthdir_y(spd,dir);
	spd = approach(spd,0,FRICTION);
}
image_angle += spin;
