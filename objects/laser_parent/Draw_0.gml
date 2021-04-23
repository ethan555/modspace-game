/// @description Move to parent
if (!instance_exists(weapon_parent)) instance_destroy();
x = weapon_parent.x;//offset_x(weapon_parent.x,weapon_parent.gun_offset_x,weapon_parent.gun_offset_y,weapon_parent.gun_angle);
y = weapon_parent.y;//offset_y(weapon_parent.y,weapon_parent.gun_offset_x,weapon_parent.gun_offset_y,weapon_parent.gun_angle);
image_angle = weapon_parent.gun_angle;
var length_ratio = 1 / sprite_get_width(sprite_index);
var lengthen_ratio = clamp((max_lifespan - lifespan) / size_time, 0, 1);
var length_max = spd * lengthen_ratio;
image_xscale = length_ratio * length_max;
var lifespan_ratio = lifespan / max_lifespan;
var width = min(lengthen_ratio,clamp(lifespan_ratio*2, 0, 1));
image_yscale = width;

var target = noone;
var collision_number = instance_place_list(x,y,solid_parent,global_collision_list,true);
var collision_length = length_max;
for (var i = 0; i < collision_number; i++) {
	var collision = global_collision_list[| i];
	if (collision.destroyed) continue;
	// Check if it is an enemy
	var faction_check = check_faction(faction,collision.faction);
	if (faction_check) {
		// Hit an enemy
		// r[0] = hit inst, r[1] = hit x, r[2] = hit y
		//var collided_array = collision_line_point(x,y,
		//	x+lengthdir_x(collision_length,image_angle),y+lengthdir_y(collision_length,image_angle),
		//	collision,false,true);
		//var c_x = collided_array[1];
		//var c_y = collided_array[2];
		//var collided_length = point_distance(x,y,c_x,c_y);
		//if (collided_length < collision_length) {
		//	target = collision;
		//	collision_length = collided_length;
		//}
		var potential_target = instance_place(x,y,collision);
		if (potential_target == noone) continue;
		target = collision;
		var potential_length = collision_length;
		
		var d = potential_length * -.5;
		var binary_search_time = ceil(log2(potential_length + 1));
		repeat (binary_search_time) {
			potential_length += d;
			image_xscale = potential_length * length_ratio;
		    var collision_inst = instance_place(x,y,collision);
		    if (collision_inst != noone) {
				collision_length = potential_length;
		        d = -abs(d * .5);
		    } else {
				d = abs(d * .5);
			}
		}
		image_xscale = collision_length * length_ratio;
	}
}
ds_list_clear(global_collision_list);

if (target != noone) {
	with(target) {
		deal_damage(x, y, other.damage_type);
	}
	image_xscale = length_ratio * (collision_length+6);
} else {
	image_xscale = length_ratio * length_max;
}

draw_self();