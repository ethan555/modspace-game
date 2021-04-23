function aim_at_target(distance, projectile_speed){
	var projectile_adj = distance/projectile_speed;
	var target_speed_adj = target.spd*projectile_adj;
	var self_speed_adj = spd*projectile_adj;
	var dx_ = lengthdir_x(target_speed_adj,target.dir) - lengthdir_x(self_speed_adj,dir);
	var dy_ = lengthdir_y(target_speed_adj,target.dir) - lengthdir_y(self_speed_adj,dir);
	var aim_at = new_aim_point(
		target.x + dx_ * aim_quality,
		target.y + dy_ * aim_quality
	);
	return aim_at;
}