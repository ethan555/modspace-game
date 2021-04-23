function save_ship() {
	ds_list_clear(player_layout_list);
	for (var i = 0, layout_number = instance_number(layout_parent); i < layout_number; i++) {
		var layout_piece_ = instance_find(layout_parent,i);
		if (layout_piece_.valid) {
			add_layout_to_list(player_layout_list,layout_piece_.object_index,layout_piece_.dx,layout_piece_.dy, layout_piece_.image_angle);
		}
	}
	ds_list_clear(player_component_list);
	for (var i = 0, component_number = instance_number(component_parent); i < component_number; i++) {
		var component_ = instance_find(component_parent,i);
		if (component_.valid) {
			add_component_to_list(player_component_list,component_.object_index,component_.dx,component_.dy, component_.image_angle);
		}
	}
	//construction = false;
	//room_goto_next();
}