function ship_fly_script() {
	if (!speed_added) {
		var xsign = sign(xspd);
		var ysign = sign(yspd);
		var dir_ = point_direction(0,0,xspd,yspd);
		xspd -= FRICTION * lengthdir_x(1,dir_) * weight_ratio;
		yspd -= FRICTION * lengthdir_y(1,dir_) * weight_ratio;
		//var spd_ = point_distance(0,0,xspd,yspd);
		if (sign(xspd) != xsign) xspd = 0;
		if (sign(yspd) != ysign) yspd = 0;
	} else {
		image_angle = approach_angle(image_angle,angle_to,max_turn_rate);
	}

	dir = point_direction(0,0,xspd,yspd);
	spd = point_distance(0,0,xspd,yspd);
	if (spd > max_spd) {
		xspd = lengthdir_x(max_spd,dir);
		yspd = lengthdir_y(max_spd,dir);
		spd = max_spd;
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