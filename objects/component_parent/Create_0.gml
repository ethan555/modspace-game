/// @description Init position
if (parent == noone) {
	x = floor(x / 16)*16;
	y = floor(y / 16)*16;
	x_start = x;
	y_start = y;
} else {
	x = parent.x + dx;
	y = parent.y + dy;
}
