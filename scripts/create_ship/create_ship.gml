function create_ship() {
	armor = 0;
	shields = 0;
	energy = 0;
	weight = 0;
	hp = hp_base;
	energy_max = 0;
	ds_list_clear(armor_list);
	ds_list_clear(shield_list);
	ds_list_clear(reactor_list);
	ds_list_clear(weapon_list);
	for (var i = 0, length = ds_list_size(layout_inst_list); i < length; i++) {
		instance_destroy(layout_inst_list[| i]);
	}
	layout_number = ds_list_size(layout_list);
	for (var i = 0, length = layout_number; i < length; i++) {
		var layout_ = layout_list[| i];
		var layout_inst_ = instance_create_depth(
			offset_x(x,layout_.dx_,layout_.dy_,image_angle),
			offset_y(y,layout_.dx_,layout_.dy_,image_angle),
			depth-1, layout_.piece_);
		ds_list_add(layout_inst_list, layout_inst_);
		with (layout_inst_) {
			dx = layout_.dx_;
			dy = layout_.dy_;
			angle = layout_.angle_;
			image_angle = angle + other.image_angle;
			parent = other;
			faction = other.faction;
			valid = true;
		}
		weight += .25;
	}

	for (var i = 0, length = ds_list_size(component_inst_list); i < length; i++) {
		instance_destroy(component_inst_list[| i]);
	}
	for (var i = 0, length = ds_list_size(component_list); i < length; i++) {
		var component_ = component_list[| i];
		var component_inst_ = instance_create_depth(
			offset_x(x,component_.dx_,component_.dy_,image_angle),
			offset_y(y,component_.dx_,component_.dy_,image_angle),
			depth-10, component_.comp_);
		ds_list_add(component_inst_list, component_inst_);
		with (component_inst_) {
			dx = component_.dx_;
			dy = component_.dy_;
			angle = layout_.angle_;
			image_angle = angle + other.image_angle;
			parent = other;
			valid = true;
			script_execute(init_script);
		}
		weight += component_inst_.weight;
	}
	weight_ratio = min(1, max_tonnage / weight);
	armor_max = max(1, armor);
	shields_max = max(1, shields);
	hp_max = max(1, hp);
	energy_max = max(1, energy_max);
	energy = energy_max;
}