function ai_broadside() {
	
	// Targeting
	find_target();
	
	if (!instance_exists(target)) {
		if (point_distance(x,y,patrol_x,patrol_y) > patrol_range) {
			ctrl_dir = point_direction(x,y,patrol_x,patrol_y);
		} else {
			var direction_ = point_direction(x,y,patrol_x,patrol_y);
			ctrl_dir = image_angle + 1 * sign_bool(angle_difference(image_angle,direction_));
		}
		ctrl_spd = .5;
		
		aim_point = new_aim_point(x + lengthdir_x(1,image_angle), y + lengthdir_y(1,image_angle));
	} else {
		// Chase target, Decide flight path
		var direction_ = point_direction(x,y,target.x,target.y);
		var distance_ = point_distance(x,y,target.x,target.y);
		var indirect = direction_ + 10 * sign_bool(angle_difference(image_angle,direction_));
		if (distance_ > target_range) {
			ctrl_dir = direction_;
		} else {
			ctrl_dir = lerp(indirect, image_angle, min(1, power(primary_range / distance_,1)));
		}
		
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
		ctrl_spd = 1;
		
		// Aim
		aim_point = aim_at_target(distance_, projectile_speed);
	}
}