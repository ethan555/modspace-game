function ai_station() {
	
	// Targeting
	find_target();
	
	if (instance_exists(target)) {
		// Chase target, Decide flight path
		var direction_ = point_direction(x,y,target.x,target.y);
		var distance_ = point_distance(x,y,target.x,target.y);
		
		if (distance_ <= primary_range) {
			inputs[PRIMARY] = true;
		} else {
			inputs[PRIMARY] = false;
		}
		
		if (distance_ <= secondary_range) {
			inputs[SECONDARY] = true;
		} else {
			inputs[SECONDARY] = false;
		}
		
		// Aim
		aim_point = aim_at_target(distance_, projectile_speed);
	}
}