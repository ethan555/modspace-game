/// @description Set gui variables

globalvar gui_alpha;
gui_alpha = .75;

bar_x = display_get_gui_width() / 2;
bar_y = display_get_gui_height() * 5/6;

shields_bar_y = bar_y - 10;
armor_bar_y = bar_y - 5;
hp_bar_y = bar_y;
energy_bar_y = bar_y + 5;

weapon_x = display_get_gui_width() / 2;
weapon_y = display_get_gui_height() * 7/8;
weapon_x_spacing = display_get_gui_width() / 20;

map_size = display_get_gui_height() - 8;

message_y = display_get_gui_height() * 3/4;
