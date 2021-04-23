/// @description Get player layout
layout_list = player_layout_list;
component_list = player_component_list;

name = player_name;

armor_list = ds_list_create();
shield_list = ds_list_create();
reactor_list = ds_list_create();
weapon_list = ds_list_create();

layout_inst_list = ds_list_create();
component_inst_list = ds_list_create();

audio_listener_position(x,y,0);
audio_listener_velocity(xspd,yspd,0);
//audio_listener_orientation(lengthdir_x(1,image_angle),lengthdir_y(1,image_angle),)

/*for (var i = 0, length = ds_list_size(layout_list); i < length; i++) {
	var layout_ = layout_list[| i];
	var layout_inst_ = instance_create_depth(
		x+layout_.dx_,
		y+layout_.dy_,
		depth-1, layout_.piece_);
	with (layout_inst_) {
		dx = layout_.dx_;
		dy = layout_.dy_;
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
		parent = other;
	}
}
