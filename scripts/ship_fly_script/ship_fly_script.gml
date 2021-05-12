function ship_fly_script() {
	var prev_spd = spd;
	if (!speed_added || spd > max_spd) {
		var dir_ = point_direction(0,0,xspd,yspd);
		var friction_weight = FRICTION * weight_ratio;
		xspd = approach(xspd, 0, abs(lengthdir_x(1,dir_)) * friction_weight);
		yspd = approach(yspd, 0, abs(lengthdir_y(1,dir_)) * friction_weight);
		prev_spd = point_distance(0,0,xspd,yspd);
	}
	if (speed_added) {
		image_angle = approach_angle(image_angle,angle_to,max_turn_rate);
	}

	dir = point_direction(0,0,xspd,yspd);
	spd = point_distance(0,0,xspd,yspd);
	var max_spd_ctrl = max_spd * min(1,ctrl_spd);
	if (spd > max_spd_ctrl && spd > prev_spd) {
		var new_spd = max(prev_spd, max_spd_ctrl);
		xspd = lengthdir_x(new_spd,dir);
		yspd = lengthdir_y(new_spd,dir);
		spd = new_spd;
	}
	
	if (spd == 0) return;
	ship_moved = true;
	
	var xx = x, yy = y;
	xx += xspd;
	yy += yspd;
	spd = point_distance(0,0,xspd,yspd);

	x = xx;//round(xx);
	y = yy;//round(yy);
}