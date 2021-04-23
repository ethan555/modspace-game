function create_explosion(explosion_) {
	var inst = instance_create_depth(x,y,depth - 100,explosion_);
	with (inst) {
		damage_type = other.damage_type;
		faction = other.faction;
		radius = random_gauss(other.explosion_radius, sqrt(other.explosion_dev));
		image_xscale = 2 * radius / BLOOM_SIZE;
		image_yscale = image_xscale;
		
		var parent_set = ds_map_create();
		var collision_number = collision_circle_list(x,y,
			radius,solid_parent,false,true,global_collision_list,true);
		/**/
		for (var i = 0; i < collision_number; i++) {
			var collision = global_collision_list[| i];
			if (ds_map_exists(parent_set,collision.parent)) {
				continue;
			} else {
				ds_map_add(parent_set,collision.parent,0);
			}
			// Check if it is an enemy
			var faction_check = check_faction(faction,collision.faction);
			if (faction_check) {
				// Hit an enemy
				// r[0] = hit inst, r[1] = hit x, r[2] = hit y
				var collided_array = collision_line_point(x,y,collision.x,collision.y,collision,false,true);
				var x_, y_
				x_ = collided_array[1];
				y_ = collided_array[2];
				with (collision) deal_damage(x_,y_,other.damage_type);
			}
		}
		ds_map_destroy(parent_set);
		ds_list_clear(global_collision_list);
	}
}