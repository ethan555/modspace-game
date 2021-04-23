function check_valid() {
	layout_number++;
	for (var a = 0; a < 360; a += 90) {
		var pieces = ds_list_create();
		var num_pieces = instance_place_list(x + lengthdir_x(1,a), y + lengthdir_y(1,a), layout_parent, pieces, false);
		if (num_pieces > 0) {
			show_debug_message("Pieces on " + string(id) + " " + string(num_pieces));
			for (var i = 0; i < num_pieces; i++) {
				var piece = pieces[| i];
				with (piece) {
					if (!valid) {
						valid = true;
						show_debug_message("Set " + string(id) + " valid");
						check_valid();
					}
				}
			}
		}
		ds_list_destroy(pieces);
	}
}