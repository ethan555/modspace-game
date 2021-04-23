/// @description Init station

// Inherit the parent event
event_inherited();

add_layout_to_list(layout_list, layout_2x1, 32, 0, 0);
add_layout_to_list(layout_list, layout_2x1, 0, -32, 90);
add_layout_to_list(layout_list, layout_2x1, -32, 0, 180);
add_layout_to_list(layout_list, layout_2x1, 0, 32, 270);
add_layout_to_list(layout_list, layout_3x1, 64, -16, 270);
add_layout_to_list(layout_list, layout_3x1, -16, -64, 0);
add_layout_to_list(layout_list, layout_3x1, -64, 16, 90);
add_layout_to_list(layout_list, layout_3x1, 16, 64, 180);
add_layout_to_list(layout_list, layout_3x3, 64, -64, 270);
add_layout_to_list(layout_list, layout_3x3, -64, -64, 0);
add_layout_to_list(layout_list, layout_3x3, -64, 64, 90);
add_layout_to_list(layout_list, layout_3x3, 64, 64, 180);

add_component_to_list(component_list, armor_massive,0,0,0);
add_component_to_list(component_list, shield_heavy,32,32,0);
add_component_to_list(component_list, gun_machinegun_heavy,48,-48,0);
add_component_to_list(component_list, gun_machinegun_heavy,-48,48,0);
add_component_to_list(component_list, gun_missile,0,64,0);
add_component_to_list(component_list, gun_missile,0,-64,0);

create_ship();
