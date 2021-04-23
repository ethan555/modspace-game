/// @description Create ship

// Inherit the parent event
event_inherited();

add_layout_to_list(layout_list,layout_3x2,-32,-48,0);
add_layout_to_list(layout_list,layout_3x2,-32,32,0);
add_layout_to_list(layout_list,layout_3x2,16,-48,0);
add_layout_to_list(layout_list,layout_3x2,16,32,0);
add_layout_to_list(layout_list,layout_3x1,32,-16,0);
add_layout_to_list(layout_list,layout_3x1,32,16,0);
add_layout_to_list(layout_list,layout_3x1,-48,-16,0);
add_layout_to_list(layout_list,layout_3x1,-48,16,0);
add_layout_to_list(layout_list,layout_2x1,-80,-16,0);
add_layout_to_list(layout_list,layout_2x1,-80,16,0);

add_component_to_list(component_list,gun_machinegun_heavy,32,-32,0);
add_component_to_list(component_list,gun_machinegun_heavy,32,32,0);
add_component_to_list(component_list,engine_parent,-64,-16,0);
add_component_to_list(component_list,engine_parent,-64,16,0);
add_component_to_list(component_list,armor_light,-16,-16,0);
add_component_to_list(component_list,shield_light,-16,16,0);
add_component_to_list(component_list,reactor_parent,0,0,0);

create_ship();
