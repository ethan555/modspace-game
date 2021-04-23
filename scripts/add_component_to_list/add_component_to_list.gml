function add_component_to_list(list_, comp, dx, dy, angle) {
	var component_ = {
		comp_	: comp,
		dx_		: dx,
		dy_		: dy,
		angle_	: angle
	};
	ds_list_add(list_, component_);
}