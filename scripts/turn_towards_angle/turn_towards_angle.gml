function turn_towards_angle(a, b, velocity, max_velocity, acceleration){
	var delta = angle_difference(b, a);
	var d_sign = sign(delta);
	var d_value = abs(delta);
	var v = velocity;
	var v_value = abs(v);
	var accel = acceleration * d_sign;
	var t = v_value / acceleration;
	if (t * v_value / 2 < d_value) {
		v += accel;
		if (abs(v) > max_velocity) {
			v = sign(v) * max_velocity;
		}
	} else {
		v = reduce(v, accel);
		/*
		if (d_value < acceleration) {
			v = 0;
		} else {
			v -= accel;
		}
		*/
	}
	v_value = abs(v);
	if (v_value >= d_value) {
		v = delta;
	}
	return v;
}