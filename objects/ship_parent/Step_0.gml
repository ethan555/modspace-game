/// @description Movement

// Move around
/*
if (ctrl_spd > 0) {
	/*
	var angle_diff = angle_difference(ctrl_dir, image_angle);
	image_angle += sign(angle_diff) * turn_rate * weight_ratio;
	if (sign(angle_difference(ctrl_dir, image_angle)) != sign(angle_diff)) {
		image_angle = ctrl_dir;
	}
	*/
/*} else {
	/*
	var xsign = sign(xspd);
	var ysign = sign(yspd);
	dir = point_direction(0,0,xspd,yspd);
	xspd -= accel_rate * lengthdir_x(1,dir);
	yspd -= accel_rate * lengthdir_y(1,dir);
	spd = point_distance(0,0,xspd,yspd);
	if (sign(xspd) != xsign) xspd = 0;
	if (sign(yspd) != ysign) yspd = 0;
	*/
	/*var xsign = sign(xspd);
	var ysign = sign(yspd);
	var dir_ = point_direction(0,0,xspd,yspd);
	xspd -= other.accel_rate * lengthdir_x(1,dir_) * weight_ratio;
	yspd -= other.accel_rate * lengthdir_y(1,dir_) * weight_ratio;
	//var spd_ = point_distance(0,0,xspd,yspd);
	if (sign(xspd) != xsign) xspd = 0;
	if (sign(yspd) != ysign) yspd = 0;
}

dir = point_direction(0,0,xspd,yspd);
spd = point_distance(0,0,xspd,yspd);
if (spd > max_spd) {
	xspd = lengthdir_x(max_spd,dir);
	yspd = lengthdir_y(max_spd,dir);
	spd = max_spd;
}
	
var xx = x, yy = y;
xx += xspd;
yy += yspd;
spd = point_distance(0,0,xspd,yspd);

x = xx;//round(xx);
y = yy;//round(yy);
/*
// Normalize to max speed
dir = point_direction(0,0,xspd,yspd);
spd = point_distance(0,0,xspd,yspd);
if (spd > max_spd) {
	xspd = lengthdir_x(max_spd,dir);
	yspd = lengthdir_y(max_spd,dir);
	spd = max_spd;
}

var xx = x, yy = y;
xx += xspd;
yy += yspd;
spd = point_distance(0,0,xspd,yspd);

x = xx;//round(xx);
y = yy;//round(yy);
*/
