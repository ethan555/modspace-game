function init_gui_bars(){
	if (instance_exists(gui_drawer)) {
		with (gui_drawer) {
			var bar_max_val = max(player.hp_max, player.shields_max, player.armor_max, player.energy_max);
			if (bar_max_val > bar_max) bar_mult = bar_max_val / bar_max;
			else if (bar_max_val < bar_min) bar_mult = bar_min / bar_max_val;
			else bar_mult = 1;
			
			hp_max_gui = player.hp_max * bar_mult;
			armor_max_gui = player.armor_max * bar_mult;
			shields_max_gui = player.shields_max * bar_mult;
			energy_max_gui = player.energy_max * bar_mult;
		}
	}
}