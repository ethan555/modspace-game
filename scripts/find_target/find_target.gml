function find_target() {
	// Count down to finding a new target
	target_timer = max(target_timer - 1, 0);
	if (target_timer <= 0) {
		target = noone;
	}
	
	if (!instance_exists(target) || target.destroyed) {
		var nearby_ship_number = collision_circle_list(x,y,target_find_range,ship_parent,false,true,global_collision_list,true);
		for (var i = 0; i < nearby_ship_number; i++) {
			var potential_target = global_collision_list[| i];
			if (potential_target.destroyed) continue;
			// If we've already checked and they are an enemy, skip checking faction
			//var faction_check = ds_map_exists(checked_ships, potential_target);
			//if (faction_check) {
			//	faction_check = checked_ships[? potential_target];
			//} else {
			var	faction_check = check_faction(faction, potential_target.faction);
			//	checked_ships[? potential_target] = faction_check;
			//}
			if (faction_check && instance_exists(potential_target.parent)) {
				target = potential_target;
				target_timer = target_time + random(target_time * .5);
				if (instance_exists(player)) {
					in_combat = in_combat || point_distance(x,y,player.x,player.y) <= COMBAT_DISTANCE;
					if (in_combat) in_combat_timer = COMBAT_TIME;
				}
				break;
			}
		}
		ds_list_clear(global_collision_list);
	}
	
	if (target_timer <= 0 && !instance_exists(target)) {
		// Fly aimlessly
		var distance_ = point_distance(x,y,patrol_x,patrol_y);
		if (distance_ < patrol_range) {
			patrol_x = random(room_width);
			patrol_y = random(room_height);
			target_timer = random_gauss(target_time_aimless, target_time_aimless / 2);
		}
	}
}