function add_layout_to_list(list_, piece, dx, dy, angle) {
	var layout_ = {
		piece_	: piece,
		dx_		: dx,
		dy_		: dy,
		angle_	: angle
	};
	ds_list_add(list_, layout_);
}