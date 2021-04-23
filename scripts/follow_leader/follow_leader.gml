function follow_leader(){
	if (instance_exists(leader)) {
		patrol_x = leader.x;
		patrol_y = leader.y;
		var leader_distance = point_distance(x,y,leader.x,leader.y);
		var leader_direction = point_direction(x,y,leader.x,leader.y);
		var follower_ratio = clamp((leader_distance / leader_follow_distance) - .5,0,1);
		ctrl_dir = lerp_angle(image_angle, leader_direction, follower_ratio);
		ctrl_spd = follower_ratio;
		return follower_ratio == 1;
		
	} else {
		return false;
	}
}