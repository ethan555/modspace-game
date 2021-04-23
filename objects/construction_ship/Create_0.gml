/// @description Setup dummy construct ship
layout_list = player_layout_list;
component_list = player_component_list;

layout_inst_list = ds_list_create();
component_inst_list = ds_list_create();

armor_list = ds_list_create();
shield_list = ds_list_create();
reactor_list = ds_list_create();
weapon_list = ds_list_create();

create_ship();