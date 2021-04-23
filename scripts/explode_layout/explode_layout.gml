function explode_layout(){
	ship_emitter_set();
	repeat(clamp(parent.weight / 5, 2, 5)) {
		ship_emitter_burst(choose_explosion(),1);
	}
	
	// Set self and all components on me to destroyed
	destroyed = true;
	image_blend = c_dkgray;
	
	var collision_number = instance_place_list(x,y,component_parent,global_component_collision_list,false);
	for (var i = 0; i < collision_number; ++i) {
	    var inst = global_component_collision_list[| i];
		if (inst.parent == parent) {
			with (inst) {
				destroyed = true;
				image_blend = c_dkgray;
			}
		}
	}
	ds_list_clear(global_component_collision_list);
}