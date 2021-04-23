/// @description Set whether valid, or move to parent
if (!construction) {
	if (instance_exists(parent)) {
		if (parent.ship_moved) {
			// Follow parent
			x = offset_x(parent.x,dx,dy,parent.image_angle);
			y = offset_y(parent.y,dx,dy,parent.image_angle);
			image_angle = parent.image_angle;
		}
	} else {
		pickup_float();
	}
}
else {dragndrop_component();}
