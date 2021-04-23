/// @description Create ship

// Inherit the parent event
event_inherited();

add_layout_to_list(layout_list,layout_1x1,0,-16,0);
add_layout_to_list(layout_list,layout_1x1,0,16,0);
add_layout_to_list(layout_list,layout_1x1,16,0,0);
add_layout_to_list(layout_list,layout_1x1,-16,0,0);

//add_component_to_list(component_list,gun_sniper,16,0,0);
add_component_to_list(component_list,gun_laser,16,0,0);
add_component_to_list(component_list,shield_light,-16,0,0);
add_component_to_list(component_list,reactor_parent,0,0,0);

create_ship();

