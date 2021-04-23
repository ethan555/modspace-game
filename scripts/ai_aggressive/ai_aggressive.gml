function ai_aggressive() {
	
	// Targeting - This sets global collision
	find_target();
	
	state_timer();
	
	if (!instance_exists(target)) {
		ai_patrol();
	} else {
		// Chase target, Decide flight path
		var direction_ = point_direction(x,y,target.x,target.y);
		var distance_ = point_distance(x,y,target.x,target.y);
		
		// Shoot at target
		fire_weapons(distance_);
		
		if (follow_leader()) return;
		
		var indirect = direction_;
		ctrl_spd = 1;
		switch(ai_state) {
			case 0: 
				indirect += 90 * sign_bool(angle_difference(image_angle,direction_));
				break;
			case 1:
				if (distance_ <= primary_range) direction_ = modulo(direction_+180, 360);
				ctrl_spd = 2;
				break;
			case 2:
				if (distance_ > primary_range / 2) ctrl_spd = 5;
				else ctrl_spd = 2 * min(power(distance_/primary_range,2), .25);
				break;
		}
		if (distance_ > target_range) {
			ctrl_dir = direction_;
		} else {
			ctrl_dir = lerp_angle(indirect, direction_, min(power(distance_/primary_range,2), 1));
		}
		
		// Aim
	}
}