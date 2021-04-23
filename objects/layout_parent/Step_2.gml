/// @description Set whether valid
if (!construction) {
	if (instance_exists(parent)) {
		if (parent.ship_moved) {
			image_angle = angle + parent.image_angle;
			x = offset_x(parent.x, dx, dy, parent.image_angle);//parent.x + dx * lengthdir_x(1, parent.image_angle) + dy * lengthdir_x(1, 270+parent.image_angle);
			y = offset_y(parent.y, dx, dy, parent.image_angle);//parent.y + dx * lengthdir_y(1, parent.image_angle) + dy * lengthdir_y(1, 270+parent.image_angle);
		}
	} else {
		// Act as pickup
		if (spd > 0) {
			x += lengthdir_x(spd,dir);
			y += lengthdir_y(spd,dir);
			spd = max(0, spd - FRICTION * weight);
		}
		if (spin > 0) {
			image_angle += spin / weight;
			spin = max(0, spin - FRICTION * weight);
		}
		lifespan --;
		image_alpha = 2 * lifespan / max_lifespan;
		if (lifespan <= 0) {
			instance_destroy();
		}
	}
}
else {dragndrop();}
