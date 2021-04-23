/// @description Collide

var collision_number = instance_place_list(x,y,solid_parent,global_collision_list,true);
for (var i = 0; i < collision_number; ++i) {
	var collision = global_collision_list[| i];
	var collision_faction = !check_faction(faction,collision.faction);
	if (collision.destroyed || collision_faction) continue;
	collision = collision.parent;
	var collided_already = ds_map_exists(collided_set,collision.id);
	if (collided_already) continue;
	collision_set_add(collided_set,collision.id);
	var collision_xspd = abs(xspd - collision.xspd);
	var collision_yspd = abs(yspd - collision.yspd);
	var collision_spd = max(2,point_distance(0,0,collision_xspd,collision_yspd));//max(dot*spd-dot*collision.spd,2);//collision.spd*2,2);
	
	var collide_weight = weight + collision.weight;
	var weight_ratio_ = 1-weight/collide_weight;
	var damage_ = max(2,min(hp,collision_spd) * weight_ratio_ / 2);
	var damage_collision_ = max(2,min(hp,collision_spd) * (1-weight_ratio_) / 2);
	var damage_type = damage_collision_set(damage_);
	var damage_collision_type = damage_collision_set(damage_collision_);
	var collided_array = collision_line_point(x,y,collision.x,collision.y,collision,false,true);
	var collision_x = collided_array[1], collision_y = collided_array[2];
	with (collision) deal_damage(collision_x,collision_y,damage_collision_type);
	if (damage_type.damage >= hp) {
		// Explode
		explode_asteroid();
		ds_list_clear(global_collision_list);
		return;
	} else {
		deal_damage(collision_x,collision_y,damage_type);
	}
	
	var collide_dir = point_direction(x,y,collision_x,collision_y);
	var collision_dspd = collision_spd*weight_ratio_ / 2;
	xspd += lengthdir_x(-collision_dspd,collide_dir);
	yspd += lengthdir_y(-collision_dspd,collide_dir);
	spd = point_distance(0,0,xspd,yspd);
	dir = point_direction(0,0,xspd,yspd);
	
	with(collision) {
		collision_dspd = collision_spd*(1-weight_ratio_);
		xspd += lengthdir_x(collision_dspd,collide_dir);
		yspd += lengthdir_y(collision_dspd,collide_dir);
		spd = point_distance(0,0,xspd,yspd);
		dir = point_direction(0,0,xspd,yspd);
	}
	break;
}
ds_list_clear(global_collision_list);

collision_set_countdown(collided_set);