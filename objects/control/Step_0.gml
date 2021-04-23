/// @description Handle controls

if (!construction) {
	if (in_combat) {
		in_combat_timer = approach(in_combat_timer, 0, 1);
		in_combat = in_combat_timer > 0;
	} else if (keyboard_check_pressed(ord("E")) && in_docking_range) {
		room_return = room;
		system_dock_state = 0;
		if (!instance_exists(system_dock_inst)) return;
		
		system_dock_id = system_dock_inst.dock_id;
		system_dock_name = system_dock_inst.dock_name;
		if (!ds_map_exists(global_dock_map, system_dock_id)) {
			// If have not generated this dock yet, generate it
			script_execute(system_dock_inst.dock_init_script);
			global_dock_map[? system_dock_id] = {
				dock_states_	: system_dock_states,
				dock_map_		: system_dock_map
			};
		} else {
			var dock_ = global_dock_map[? system_dock_id];
			system_dock_states = dock_.dock_states_;
			system_dock_map = dock_.dock_map_;
		}
	
		room_persistent = true;
		construction = true;
		dock_tab_index = 0;
		layout_number = 0;
		layout_bool = true;
		if (instance_exists(player)) {
			player.persistent = false;
		}
		/**/
	
		room_goto(Construction);
		if (instance_exists(player)) {
			player.persistent = false;
		}
	}
} else {
	if (keyboard_check_pressed(ord("1"))) {
		// Switch to layout
		shop_switch_type(true, LAYOUT);
	} else if (keyboard_check_pressed(ord("2"))) {
		// Switch to weapons
		shop_switch_type(false, WEAPONS);
	} else if (keyboard_check_pressed(ord("3"))) {
		// Switch to armor
		shop_switch_type(false, ARMOR);
	} else if (keyboard_check_pressed(ord("4"))) {
		// Switch to shields
		shop_switch_type(false, SHIELDS);
	} else if (keyboard_check_pressed(ord("5"))) {
		// Switch to reactors
		shop_switch_type(false, ENGINES);
	} else if (keyboard_check_pressed(ord("6"))) {
		// Switch to armor
		shop_switch_type(false, REACTORS);
	} else if (keyboard_check_pressed(ord("7"))) {
		// Switch to shields
		shop_switch_type(false, ACTIVES);
	} else if (keyboard_check_pressed(ord("8"))) {
		// Switch to reactors
		shop_switch_type(false, PASSIVES);
	} else if (keyboard_check_pressed(ord("9"))) {
		// Switch to reactors
		shop_switch_type(false, PROTOTYPES);
	}
	if (keyboard_check_pressed(vk_tab)) {
		dock_tab_index = modulo(dock_tab_index+1,ds_list_size(system_dock_states));
		shop_deactivate();
		system_dock_state = system_dock_states[| dock_tab_index];
	}
	if (keyboard_check_pressed(vk_enter)) {
		var ship = instance_find(ship_parent, 0);
		if (layout_number <= ship.max_layouts) {
			save_ship();
			construction = false;
			room_goto(room_return);
		}
	}
}
