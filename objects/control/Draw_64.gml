/// @description Draw Gui

if (!construction) {
	if (in_docking_range) {
		if (in_combat) {
			draw_sprite(in_combat_sp,0,display_get_gui_width()/2,display_get_gui_height()-1);
		} else {
			draw_sprite(dock_sp,0,display_get_gui_width()/2,display_get_gui_height()-1);
		}
	}
} else {
	// Draw construction gui
	switch(system_dock_state) {
		case SHOP:
			break;
		case COMMERCE:
			break;
		case MERCENARY:
			break;
		case HQ:
			break;
	}
	for (var i = 0, length = ds_list_size(system_dock_states); i < length; i++) {
		switch(system_dock_states[| i]) {
			case SHOP:
				draw_sprite(gui_dock_tab_sp, system_dock_state == SHOP, i * 23, 0);
				break;
			case COMMERCE:
				draw_sprite(gui_cmrc_tab_sp, system_dock_state == COMMERCE, i * 23, 0);
				break;
			case MERCENARY:
				draw_sprite(gui_merc_tab_sp, system_dock_state == MERCENARY, i * 23, 0);
				break;
			case HQ:
				draw_sprite(gui_hq_tab_sp, system_dock_state == HQ, i * 23, 0);
				break;
		}
	}
}
