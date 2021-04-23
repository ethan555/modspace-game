/// @description Collide with enemies
var target_found = false;
collision_circle_list(x,y,target_radius,solid_parent,false,true,global_collision_list,true);
for (var i = 0, collision_number = ds_list_size(global_collision_list); i < collision_number; i++) {
	var collision = global_collision_list[| i];
	if (instance_exists(collision)) {
		if (check_faction(faction,collision.faction) && instance_exists(collision.parent)) {
			target_found = true;
			break;
		}
	}
}
ds_list_clear(global_collision_list);

if (target_found) {
	script_execute(explosion_script);
}
