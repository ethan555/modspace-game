/// @description Init layout

// Inherit the parent event
event_inherited();

add_layout_to_list(layout_list,layout_2x1,0,-16,90);
add_layout_to_list(layout_list,layout_2x1,0,16,270);
add_layout_to_list(layout_list,layout_2x1,16,-16,0);
add_layout_to_list(layout_list,layout_2x1,16,16,0);
add_layout_to_list(layout_list,layout_1x1,-16,-16,0);
add_layout_to_list(layout_list,layout_2x1,-16,16,0);

add_component_to_list(component_list,gun_machinegun,16,-16,0);
add_component_to_list(component_list,gun_machinegun,16,16,0);
add_component_to_list(component_list,engine_parent,0,-16,0);
add_component_to_list(component_list,engine_parent,0,16,0);
add_component_to_list(component_list,armor_light,-16,-16,0);
add_component_to_list(component_list,shield_light,-16,16,0);
add_component_to_list(component_list,reactor_parent,0,0,0);

create_ship();

ai_state_times[0] = seconds_to_frames(3);
ai_state_times[1] = seconds_to_frames(.5);
ai_state_times[2] = seconds_to_frames(3);

//target_time += seconds_to_frames(random(target_time));
//target_time_aimless += seconds_to_frames(random(target_time_aimless));
