function check_valid_ship() {
	layout_number = 0;
	var piece;
	for (var a = 0; a < 360; a += 90) {
		piece = instance_place(x + lengthdir_x(1,a), y + lengthdir_y(1,a), layout_parent);
		if (piece != noone) {
			//show_debug_message("Validating " + string(a));
			with (piece) {
				if (!valid) {
					valid = true;
					//show_debug_message("Set " + string(id) + " valid");
					check_valid();
				}
			}
		}
	}
	with (layout_parent) {
		if (!valid) {
			reset_piece();
		}
	}
}