function blink_script(){
	
	if (active || active_index > 0) {
		var active_half = active_index_max/2;
		var active_amount = 1 - abs(active_half - active_index) / active_half;
		var b_distance = blink_distance * active_amount;
		with (parent) {
			var dx_ = lengthdir_x(b_distance,image_angle);
			var dy_ = lengthdir_y(b_distance,image_angle);
			x += dx_;
			y += dy_;
		}
		use_energy();
		active_index++;
		
		if (active_index >= active_index_max) {
			active_index = 0;
			alarm[0] = seconds_to_frames(5);
		}
	}
}