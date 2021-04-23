function engine_control() {
	if (construction || !instance_exists(parent)) return;
	// Inherit the parent event
	if (parent.ctrl_spd > 0) {
		var destroyed_effect = destroyed ? destroyed_effectiveness : 1;
		var energy_effect = max(energy_effectiveness, parent.energy / parent.energy_max);
		var effectiveness = destroyed_effect * energy_effect;
		var accel_rate_effect = accel_rate * effectiveness;
		var turn_rate_effect = turn_rate * effectiveness;
		image_angle = approach_angle(image_angle, parent.ctrl_dir, engine_turn_rate * effectiveness);
		trail_size = min(trail_size + accel_rate_effect, parent.ctrl_spd);
		with (parent) {
			angle_to = approach_angle(angle_to, ctrl_dir, turn_rate_effect * weight_ratio);
			var spd_change = accel_rate_effect * ctrl_spd * weight_ratio;
			xspd = xspd + lengthdir_x(spd_change, ctrl_dir);
			yspd = yspd + lengthdir_y(spd_change, ctrl_dir);
			speed_added = true;
		}
		use_energy();
	}
}