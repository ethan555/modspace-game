function player_controls() {
	inputs[UP] = keyboard_check(key_bindings[UP]);
	inputs[LEFT] = keyboard_check(key_bindings[LEFT]);
	inputs[DOWN] = keyboard_check(key_bindings[DOWN]);
	inputs[RIGHT] = keyboard_check(key_bindings[RIGHT]);
	
	inputs[PRIMARY] = keyboard_check_pressed(key_bindings[PRIMARY]) || mouse_check_button(mb_left);
	inputs[SECONDARY] = keyboard_check_pressed(key_bindings[SECONDARY]) || mouse_check_button(mb_right);
	
	inputs[ACTIVE] = keyboard_check_pressed(key_bindings[ACTIVE]) || keyboard_check_pressed(vk_shift);
	
	aim_point = new_aim_point(mouse_x,mouse_y);
	
	// If warping out, go to the warp
	if (warping > 0) {
		ctrl_spd = 1;
		ctrl_dir = warp_dir;
		return;	
	}
	ctrl_spd = (inputs[UP] ^^ inputs[DOWN]) || (inputs[LEFT] ^^ inputs[RIGHT]);
	if (ctrl_spd > 0) {
		ctrl_dir = point_direction(0,0,-inputs[LEFT]+inputs[RIGHT],-inputs[UP]+inputs[DOWN]);
	}
	
}