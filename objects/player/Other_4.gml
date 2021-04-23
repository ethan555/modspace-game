/// @description Generate Parts
create_ship();
init_gui_bars();
/*
for (var i = 0, length = ds_list_size(layout_list); i < length; i++) {
	var layout_ = layout_list[| i];
	var layout_inst_ = instance_create_depth(
		x+layout_.dx_,
		y+layout_.dy_,
		depth-1, layout_.piece_);
	with (layout_inst_) {
		dx = layout_.dx_;
		dy = layout_.dy_;
		image_angle = layout_.angle_;
		parent = other;
		faction = other.faction;
	}
}

for (var i = 0, length = ds_list_size(component_list); i < length; i++) {
	var component_ = component_list[| i];
	var component_inst_ = instance_create_depth(
		x+component_.dx_,
		y+component_.dy_,
		depth-10, component_.comp_);
	with (component_inst_) {
		dx = component_.dx_;
		dy = component_.dy_;
		image_angle = layout_.angle_;
		parent = other;
	}
}