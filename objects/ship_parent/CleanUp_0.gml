/// @description Destroy memory
ds_list_destroy(layout_list);
ds_list_destroy(component_list);

// Destroy children
ds_list_destroy(layout_inst_list);
ds_list_destroy(component_inst_list);

ds_list_destroy(armor_list);
ds_list_destroy(shield_list);
ds_list_destroy(reactor_list);
ds_list_destroy(weapon_list);
