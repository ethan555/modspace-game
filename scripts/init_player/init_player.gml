function init_player(){
	add_layout_to_list(player_layout_list,layout_3x1,-16,-16,0);
	add_layout_to_list(player_layout_list,layout_3x1,-16,16,0);
	add_layout_to_list(player_layout_list,layout_2x1,16,0,0);

	add_component_to_list(player_component_list,gun_laser,16,-16,0);
	add_component_to_list(player_component_list,engine_light,-16,-16,0);
	add_component_to_list(player_component_list,engine_light,-16,16,0);
	add_component_to_list(player_component_list,armor_light,0,-16,0);
	add_component_to_list(player_component_list,shield_light,0,16,0);
	add_component_to_list(player_component_list,reactor_parent,0,0,0);
	add_component_to_list(player_component_list,active_blink,16,0,0);
}