function pickup_float() {
	// Act as pickup
	if (spd > 0) {
		x += lengthdir_x(spd,dir);
		y += lengthdir_y(spd,dir);
		spd = max(0, spd - FRICTION / weight);
	}
	if (spin > 0) {
		image_angle += spin / weight;
	}
}