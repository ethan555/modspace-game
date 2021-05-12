/// @description Init globals

globalvar debug;
debug = false;
if (debug) show_debug_overlay(true);

#region Resolution Setup
globalvar monitorw, monitorh, wmult, hmult;
monitorw = display_get_width();
monitorh = display_get_height();
window_set_size(monitorw, monitorh);
wmult = .5;
hmult = .5;
if (monitorw <= 1920/2 && monitorh <= 1080/2) {
	wmult = 1;
	hmult = 1;
}
surface_resize(application_surface, monitorw / wmult, monitorh / hmult);
display_set_gui_maximize(monitorw / 2, monitorh / 2);
window_set_fullscreen(true);
window_set_cursor(cr_none);
cursor_sprite = crosshairs_sp;
#endregion

#region Audio Setup
audio_listener_orientation(0,0,1000,0,-1,0);
audio_falloff_set_model(audio_falloff_linear_distance);
audio_master_gain(.5);
#endregion

#region Dock Control
globalvar construction, layout_bool, in_docking_range, room_return, layout_number;
construction = false;
layout_bool = true;
layout_number = 0;
in_docking_range = false;
room_return = room;

globalvar system_dock_inst, system_dock_id, system_dock_name, system_dock_states, system_dock_map, system_dock_state, system_shop_states, dock_tab_index;
system_dock_inst = noone;
system_dock_id = 0;
system_dock_name = "";
// Dock shop, mercenary listings, etc.
system_dock_states = noone; // = ds_list_create();
system_dock_map = noone; //ds_map_create();
system_dock_state = 0;
//system_shop_states = noone; // = ds_list_create();
dock_tab_index = 0;

globalvar global_dock_map;
global_dock_map = ds_map_create();
globalvar shop_array, shop_index;
shop_array = array_create(10);
shop_index = 0;
for (var i = 0, length = array_length(shop_array); i < length; i++) {
	shop_array[i] = ds_list_create();
}
/*
shop_ = {
	shop_id		: shop_id, // room_name + x + y
	shop_map	: create_shop_map(faction, type),
	commerce_map	: create_commerce_map(faction, type),
	mercenary_map	: create_mercenary_map(faction),
}
*/
#endregion

#region Faction Maps
globalvar faction_map,
	united_nations_map,
	sila_alhant_map,
	deminance_collective_map,
	archaedemics_map,
	rr_rhhd_map,
	watchfire_ward_map,
	pirates_map,
	none_map;
faction_map = ds_map_create();
united_nations_map = ds_map_create();
sila_alhant_map = ds_map_create();
deminance_collective_map = ds_map_create();
archaedemics_map = ds_map_create();
rr_rhhd_map = ds_map_create();
watchfire_ward_map = ds_map_create();
pirates_map = ds_map_create();
none_map = ds_map_create();

united_nations_map[? NO] = 1;
none_map[? UN] = 1;

faction_map[? UN] = united_nations_map;
faction_map[? SA] = sila_alhant_map;
faction_map[? DC] = deminance_collective_map;
faction_map[? AD] = archaedemics_map;
faction_map[? RR] = rr_rhhd_map;
faction_map[? WW] = watchfire_ward_map;
faction_map[? PI] = pirates_map;
faction_map[? NO] = none_map;


globalvar united_nations_shops;
united_nations_shops = init_un_shop_map();

globalvar faction_color;
faction_color = ds_map_create();
faction_color[? UN] = c_aqua;
faction_color[? NO] = c_fuchsia;
faction_color[? SA] = c_yellow;
#endregion

#region Player Stats
globalvar player_name, player_stats;
player_name = "Longshot";
globalvar player_layout_list, player_component_list;
player_layout_list = ds_list_create();
player_component_list = ds_list_create();
init_player();

globalvar key_bindings;
/*
#macro UP 0
#macro LEFT 1
#macro DOWN 2
#macro RIGHT 3
#macro PRIMARY 4
#macro SECONDARY 5
#macro ACTIVE 6
*/
key_bindings = array_create(INPUT_NUMBER);
key_bindings[UP] = ord("W");
key_bindings[LEFT] = ord("A");
key_bindings[DOWN] = ord("S");
key_bindings[RIGHT] = ord("D");
key_bindings[PRIMARY] = ord("J");//mb_left;
key_bindings[SECONDARY] = ord("K");//mb_right;
key_bindings[ACTIVE] = ord("L");//vk_shift;

globalvar in_combat, in_combat_timer;
in_combat = false;
in_combat_timer = 0;
#endregion

#region Collision
globalvar global_collision_list, global_component_collision_list;
global_collision_list = ds_list_create();
global_component_collision_list = ds_list_create();
#endregion

#region System Init
init_particles();
globalvar part_emitter;
part_emitter = part_emitter_create(part_system);

globalvar dialogue_buffer, dialogue_index, dialogue_faction_data;
dialogue_buffer = array_create(60);
dialogue_index = 0;
dialogue_faction_data = {
	un: {
		normal: {
			friend: [
				"Greetings, %NAME%!",
				"Any news, %NAME%?"
			],
			enemy: [
				"Keep your distance, %NAME%!"
			],
			none: [
				"What a lovely day."
			]
		},
		aggressive: {
			friend: [
				"Keep an eye out, %NAME%.",
				"Got your 6, %NAME%."
			],
			enemy: [
				"Try it, %NAME%!"
			],
			none: [
				"Patrolling."
			]
		}
	},
	no: {
		normal: {
			friend: [
				"Good hunting, %NAME%!",
				"Watching with interest, %NAME%."
			],
			enemy: [
				"You're out of your element, %NAME%!"
			],
			none: [
				"Searching..."
			]
		},
		aggressive: {
			friend: [
				"Smells like fresh meat, %NAME%.",
				"This will be our big break, %NAME%."
			],
			enemy: [
				"You're done, %NAME%!"
			],
			none: [
				"The hunt is on."
			]
		}
	}
};
#endregion

if (!instance_exists(view_control)) {
	instance_create_depth(x,y,0,view_control);
}
if (!instance_exists(audio_player)) {
	instance_create_depth(x,y,0,audio_player);
}
if (!instance_exists(trail_drawer)) {
	instance_create_depth(x,y,TRAIL_DEPTH,trail_drawer);
}
if (!instance_exists(background_drawer)) {
	instance_create_depth(x,y,BACKGROUND_DEPTH,background_drawer);
}
if (!instance_exists(ship_control)) {
	instance_create_depth(x,y,0,ship_control);
}
if (!instance_exists(gui_drawer)) {
	instance_create_depth(x,y,0,gui_drawer);
}

room_goto_next();
