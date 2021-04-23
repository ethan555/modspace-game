/// @description Set whether valid
if (!construction && parent != noone) {
	image_angle = parent.image_angle;
	x = parent.x + dx * lengthdir_x(1, parent.image_angle) + dy * lengthdir_x(1, 270+parent.image_angle);
	y = parent.y + dx * lengthdir_y(1, parent.image_angle) + dy * lengthdir_y(1, 270+parent.image_angle);
}
else {dragndrop();}
