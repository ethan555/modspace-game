function damage_collision_line(x_collide, y_collide, collision_number){
	for (var i = 0; i < collision_number; i++) {
		var collision = global_collision_list[| i];
		if (collision.destroyed) continue;
		// Check if it is an enemy
		var faction_check = check_faction(faction,collision.faction);
		if (faction_check) {
			// Hit an enemy
			// r[0] = hit inst, r[1] = hit x, r[2] = hit y
			var collided_array = collision_line_point(x,y,collision.x,collision.y,collision,false,true);
			x = collided_array[1];
			y = collided_array[2];
			script_execute(end_script,collision);
			break;
		}
	}
}