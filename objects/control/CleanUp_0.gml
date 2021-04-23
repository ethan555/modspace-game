/// @description Clean up

ds_map_destroy(faction_map);

ds_map_destroy(faction_map);
ds_map_destroy(united_nations_map);
ds_map_destroy(sila_alhant_map);
ds_map_destroy(deminance_collective_map);
ds_map_destroy(archaedemics_map);
ds_map_destroy(rr_rhhd_map);
ds_map_destroy(watchfire_ward_map);
ds_map_destroy(pirates_map);
ds_map_destroy(none_map);

ds_list_destroy(player_layout_list);
ds_list_destroy(player_component_list);
ds_list_destroy(global_collision_list);
ds_list_destroy(global_component_collision_list);
if (ds_exists(system_dock_map,ds_type_map)) ds_map_destroy(system_dock_map);
if (ds_exists(system_dock_states,ds_type_list)) ds_list_destroy(system_dock_states);
