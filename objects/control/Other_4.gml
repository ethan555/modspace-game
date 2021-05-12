/// @description Create necessary objects
if (!instance_exists(view_control)) {
	instance_create_depth(x,y,0,view_control);
}
if (!instance_exists(trail_drawer)) {
	instance_create_depth(x,y,TRAIL_DEPTH,trail_drawer);
}

collision_point_list(-100,-100,solid_parent,false,true,global_collision_list,false);
ds_list_clear(global_collision_list);
collision_point_list(-100,-100,solid_parent,false,true,global_component_collision_list,false);
ds_list_clear(global_component_collision_list);

if (construction) {
	var view_width = camera_get_view_width(view_camera[0]);
	var view_height = camera_get_view_height(view_camera[0]);
	var view_third_width =  view_width/ 3;
	var view_third_height = view_height / 3;
	
	// Clear the shop item list
	for (var i = 0, length = array_length(shop_array); i < length; i++) {
		ds_list_clear(shop_array[i]);
	}
	shop_index = 0;
	
	// dock_shops is an array of ds_lists
	var dock_shops = system_dock_map[? SHOP];
	for (var type = 0, shop_number = 9; type < shop_number; type++) {
		// Populate the shops
		// shop is a ds_list
		var shop = dock_shops[type];
		var width_ = 16, height_ = 16, leftover = 0,
			xx = 16, yy = 16, xmin = 2*view_third_width, xmax = floor(view_third_width / 16)*16-16;
		for (var i = 0, length = ds_list_size(shop); i < length; i++) {
			var inst_ = instance_create_depth(
				xx + xmin, yy,
				depth, shop[| i]);
			xx += max(0, sprite_get_width(inst_.sprite_index));
			if (xx > xmax) {
				xx = 0;
				yy += height_;
				inst_.x = xx + xmin;
				inst_.y = yy;
			}
			ds_list_add(shop_array[type], inst_);
		}
		if (type != 0) {
			// Deactivate all non layout objects
			var shop_items = shop_array[type];
			for (var j = 0, length = ds_list_size(shop_items); j < length; j++) {
				instance_deactivate_object(shop_items[| j]);
			}
		}
	}
} else {
	room_persistent = false;
	if (instance_exists(player)) {
		player.persistent = true;
		with (player) {
			//create_ship();
		}
	}
}