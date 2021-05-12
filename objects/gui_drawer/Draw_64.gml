/// @description Draw GUI
if (!construction && instance_exists(player)) {
	
	#region Draw Bars
	var hp_prev=hp_gui,shields_prev=shields_gui,armor_prev=armor_gui,energy_prev=energy_gui;
	hp_gui = approach(hp_gui, player.hp, GUI_BAR_RATE);
	shields_gui = approach(shields_gui, player.shields, GUI_BAR_RATE);
	armor_gui = approach(armor_gui, player.armor, GUI_BAR_RATE);
	energy_gui = max(0, approach(energy_gui, player.energy, GUI_BAR_RATE));
	
	hp_gui_timer = max(0,hp_gui_timer - 1);
	shields_gui_timer = max(0,shields_gui_timer - 1);
	armor_gui_timer = max(0,armor_gui_timer - 1);
	energy_gui_timer = max(0,energy_gui_timer - 1);
	
	if (hp_gui_timer == 0 && hp_gui == player.hp_max && hp_prev != hp_gui) hp_gui_timer = GUI_BAR_DISAPPEAR_TIME;
	if (shields_gui_timer == 0 && shields_gui == player.shields_max && shields_prev != shields_gui) shields_gui_timer = GUI_BAR_DISAPPEAR_TIME;
	if (armor_gui_timer == 0 && armor_gui == player.armor_max && armor_prev != armor_gui) armor_gui_timer = GUI_BAR_DISAPPEAR_TIME;
	if (energy_gui_timer == 0 && energy_gui == player.energy_max && energy_prev != energy_gui) energy_gui_timer = GUI_BAR_DISAPPEAR_TIME;
	
	var bar_y_current = bar_y - 10;
	
	if (shields_gui < player.shields_max || shields_gui_timer > 0) {
		shields_bar_y = lerp(shields_bar_y,bar_y_current,bar_y_lerp);
		if (shields_gui > 0) draw_sprite_ext(shield_bar,0,bar_x-shields_max_gui/2,shields_bar_y,shields_gui * bar_mult,bar_height,0,c_white,gui_alpha);
		draw_sprite_ext(shield_bar,0,bar_x-shields_max_gui/2 + shields_gui * bar_mult,shields_bar_y,shields_max_gui - shields_gui * bar_mult,bar_height,0,c_white,gui_alpha / 4);
		if (player.shield_refresh_counter < SHIELD_REFRESH_TIME) draw_sprite_ext(shield_refresh_bar,0,bar_x-shields_max_gui/2,bar_y - 10 + 3,shields_max_gui * player.shield_refresh_counter / SHIELD_REFRESH_TIME,1,0,c_white,gui_alpha);
		bar_y_current += 5;
	}
	
	if (armor_gui < player.armor_max || armor_gui_timer > 0) {
		armor_bar_y = lerp(armor_bar_y,bar_y_current,bar_y_lerp);
		if (armor_gui > 0) draw_sprite_ext(armor_bar,0,bar_x-armor_max_gui/2,armor_bar_y,armor_gui * bar_mult,bar_height,0,c_white,gui_alpha);
		draw_sprite_ext(armor_bar,0,bar_x-armor_max_gui/2 + armor_gui * bar_mult,armor_bar_y,armor_max_gui - armor_gui * bar_mult,bar_height,0,c_white,gui_alpha / 4);
		bar_y_current += 5;
	}
	
	if (hp_gui < player.hp_max || hp_gui_timer > 0) {
		hp_bar_y = lerp(hp_bar_y,bar_y_current,bar_y_lerp);
		if (hp_gui > 0) draw_sprite_ext(hp_bar,0,bar_x-hp_max_gui/2,hp_bar_y,hp_gui * bar_mult,bar_height,0,c_white,gui_alpha);
		draw_sprite_ext(hp_bar,0,bar_x-hp_max_gui/2 + hp_gui * bar_mult,hp_bar_y,hp_max_gui - hp_gui * bar_mult,bar_height,0,c_white,gui_alpha / 4);
		bar_y_current += 5;
	}
		
	if (energy_gui < player.energy_max || energy_gui_timer > 0) {
		energy_bar_y = lerp(energy_bar_y,bar_y_current,bar_y_lerp);
		draw_sprite_ext(energy_bar,0,bar_x-energy_max_gui/2 + energy_gui * bar_mult,energy_bar_y,energy_max_gui - energy_gui * bar_mult,bar_height,0,c_white,gui_alpha / 4);
		if (energy_gui > 0) draw_sprite_ext(energy_bar,0,bar_x-energy_max_gui/2,energy_bar_y,energy_gui * bar_mult,bar_height,0,c_white,gui_alpha);
		bar_y_current += 5;
	}
	#endregion
	
	#region Draw Weapons
	var weapon_list = player.weapon_list;
	var length = ds_list_size(weapon_list);
	var total_spacing = length * weapon_x_spacing;
	for (var i = 0; i < length; ++i) {
		// Gray if can't fire, color if can
		// Some of sprite if reloading, all if loaded
		var weapon = weapon_list[| i];
		var w_x = weapon_x + (i / max(1,length - 1)) * total_spacing - total_spacing / 2;
		var w_y = weapon_y;
		var w_sprite = weapon.sprite_index;
		//var w_xoffset = sprite_get_xoffset(w_sprite);
		//var w_yoffset = sprite_get_yoffset(w_sprite);
		var w_color = weapon.gun_can_fire ? c_white : c_dkgray;
		//if (weapon.gun_load < weapon.gun_reload) {
		//	//var w_sprite_width = sprite_get_width(w_sprite);
		//	//var w_sprite_height = sprite_get_height(w_sprite);
		//	//var load = w_sprite_height * (weapon.gun_load / weapon.gun_reload);
		//	//draw_sprite_part_ext(w_sprite,0,0,load,
		//	//	w_sprite_width,w_sprite_height - load,
		//	//	w_x-w_xoffset*weapon_scale, w_y-w_yoffset*weapon_scale+load, weapon_scale, weapon_scale, w_color, gui_alpha);
		//	//draw_sprite_part_ext(w_sprite,0,0,0,
		//	//	w_sprite_width,load,
		//	//	w_x-w_xoffset*weapon_scale, w_y-w_yoffset*weapon_scale, weapon_scale, weapon_scale, c_dkgray, gui_alpha);
		//	//var load = 
		//} else {
		draw_sprite_ext(w_sprite,0,w_x,w_y,weapon_scale,weapon_scale,0,w_color,gui_alpha);
		if (weapon.gun_load < weapon.gun_reload) {
			draw_sprite_ext(rectangle_sp,0,w_x-weapon_bar_length/2,w_y+weapon_bar_y_offset,weapon.gun_load / weapon.gun_reload * weapon_bar_length,2,0,c_white,gui_alpha);
		}
		//}
	}
	#endregion
	
	#region Draw Messages
	if (map_scale < 1) {
		draw_dialogue();
	}
	#endregion
	
	#region Draw map
	var map_size_scaled = map_size * map_scale;
	var xmin = map_x, xmax = map_x+map_size_scaled, ymin = map_y, ymax = map_y+map_size_scaled;
	var map_icon_scale = map_scale / 2;
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	if (map_size_scaled != 0) {
		draw_sprite_ext(map_background_sp,0,map_x,map_y,map_size_scaled,map_size_scaled,0,0,gui_alpha);
		draw_rectangle_sprite(map_x,map_y,map_size_scaled,map_size_scaled,c_white,gui_alpha);
		with (ship_parent) {
			var x_m = clamp(other.map_x + x / room_width * map_size_scaled,xmin,xmax),
				y_m = clamp(other.map_y + y / room_height * map_size_scaled,ymin,ymax);
			draw_sprite_ext(map_icon,0,x_m,y_m,map_icon_scale,map_icon_scale,image_angle,check_faction(faction, player.faction) ? c_red : c_aqua,gui_alpha);
		}
		with (hazard_parent) {
			
			var x_m = clamp(other.map_x + x / room_width * map_size_scaled,xmin,xmax),
				y_m = clamp(other.map_y + y / room_height * map_size_scaled,ymin,ymax);
			//var x_m = other.map_x + x / room_width * map_size_scaled, y_m = other.map_y + y / room_height * map_size_scaled;
			draw_sprite_ext(map_icon,0,x_m,y_m,map_icon_scale,map_icon_scale,image_angle,check_faction(faction, player.faction) ? c_red : c_aqua,gui_alpha);
		}
		with (warp_gate) {
			var x_m = other.map_x + x / room_width * map_size_scaled, y_m = other.map_y + y / room_height * map_size_scaled;
			draw_sprite_ext(map_icon,0,x_m,y_m,map_icon_scale,map_icon_scale,warp_direction,c_white,gui_alpha);
		}
		with(damage_parent) {
			var damage_icon_scale = max(.5,map_icon_scale*2);
			var x_m = clamp(other.map_x + x / room_width * map_size_scaled,xmin,xmax),
				y_m = clamp(other.map_y + y / room_height * map_size_scaled,ymin,ymax);
			draw_sprite_ext(rectangle_sp,0,x_m,y_m,damage_icon_scale,damage_icon_scale,0,c_white,gui_alpha);
		}
		
		if (map_scale == 1) {
			with (ship_parent) {
				var x_m = clamp(other.map_x + x / room_width * map_size_scaled,xmin,xmax),
					y_m = clamp(other.map_y + y / room_height * map_size_scaled,ymin,ymax);
				if (other.map_show_names) draw_text_transformed(x_m,y_m + other.name_y,name,other.font_scale,other.font_scale,0);
			}
			with (warp_gate) {
				var x_m = other.map_x + x / room_width * map_size_scaled, y_m = other.map_y + y / room_height * map_size_scaled;
				if (other.map_show_names) draw_text_transformed(x_m,y_m + other.name_y,"To "+room_get_name(room_to),other.font_scale,other.font_scale,0);
			}
		}
		// Draw map name
		draw_set_font(display_font);
		draw_sprite_ext(rectangle_sp,0,map_x+1,ymax-(map_name_height+1),map_size_scaled - 2,map_name_height,0,c_black,gui_alpha);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text_transformed(map_x + 2,ymax-2,room_get_name(room),font_scale,font_scale,0);
	}
	#endregion
	
}
