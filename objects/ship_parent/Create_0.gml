/// @description Init layout
/*
x = floor(x / 16)*16;
y = floor(y / 16)*16;
*/

// List of gun instances
layout_list = ds_list_create();
component_list = ds_list_create();

layout_inst_list = ds_list_create();
component_inst_list = ds_list_create();

armor_list = ds_list_create();
shield_list = ds_list_create();
reactor_list = ds_list_create();
weapon_list = ds_list_create();

weight_ratio = max(weight/max_tonnage, 1);

angle_to = image_angle;

//gun_list = ds_list_create();
