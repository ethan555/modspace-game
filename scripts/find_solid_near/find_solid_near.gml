function find_solid_near(x_, y_, radius_) {
	var result = noone;
	collision_circle_list(x_,y_,radius_,solid_parent,false,true,global_collision_list,true);
	for (var i = 0, collision_number = ds_list_size(global_collision_list); i < collision_number; i++) {
		var collision = global_collision_list[| i];
		if (instance_exists(collision) && !collision.destroyed) {
			if (check_faction(faction,collision.faction) && instance_exists(collision.parent)) {
				result = collision;
				break;
			}
		}
	}
	ds_list_clear(global_collision_list);
	return result;
}