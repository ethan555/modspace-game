/// @description Get map input

if (keyboard_check_pressed(ord("M"))) {
	map_state = modulo(map_state + 1, map_states);
	switch(map_state) {
		case 0:
			// Minimap
			map_scale = map_mini_scale;
			map_x = 4;
			break;
		case 1:
			// Full map
			name_y = 10;
			map_scale = 1;
			map_x = display_get_gui_width() / 2 - map_size/2;
			break;
		case 2:
			// No map
			map_scale = 0;
			break;
		default:
			break;
	}
}

if (keyboard_check_pressed(ord("N"))) {
	map_show_names = !map_show_names;
}
