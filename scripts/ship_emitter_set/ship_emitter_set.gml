function ship_emitter_set(){
	var emit = part_emitter;
	part_emitter_region(part_system,emit,bbox_left,bbox_right,bbox_top,bbox_bottom,ps_shape_ellipse,ps_distr_gaussian);
}