function ai_patrol(){
	if (follow_leader()) return;
	// Patrol around
	if (point_distance(x,y,patrol_x,patrol_y) > patrol_range) {
		ctrl_dir = point_direction(x,y,patrol_x,patrol_y);
		ctrl_spd = 1;
	} else {
		var direction_ = point_direction(x,y,patrol_x,patrol_y);
		ctrl_dir = image_angle + 1 * sign_bool(angle_difference(image_angle,direction_));
		target_time-=3;
		ctrl_spd = .25;
	}
		
	aim_point = new_aim_point(x + lengthdir_x(100,image_angle), y + lengthdir_y(100,image_angle));
}