/// @description Fly towards near targets

// Inherit the parent event
event_inherited();

//if (!instance_exists(self)) return;

if (!instance_exists(target) || !instance_exists(target.parent) || target.destroyed) {
	//var collision_number = 
	collision_circle_list(x,y,track_radius,targetable_parent,false,true,global_collision_list,true);
	for (var i = 0, collision_number = ds_list_size(global_collision_list); i < collision_number; i++) {
		var collision = global_collision_list[| i];
		if (instance_exists(collision) && !collision.destroyed) {
			if (check_faction(faction,collision.faction) && instance_exists(collision.parent)) {
				target = collision;
				break;
			}
		}
	}
	ds_list_clear(global_collision_list);
}

var xspd = lengthdir_x(spd, dir), yspd = lengthdir_y(spd, dir);
if (instance_exists(target)) {
	//var collision_number = 
	collision_circle_list(x,y,explode_distance,solid_parent,false,true,global_collision_list,true);
	for (var i = 0, collision_number = ds_list_size(global_collision_list); i < collision_number; i++) {
		var collision = global_collision_list[| i];
		if (instance_exists(collision)) {
			if (check_faction(faction,collision.faction)) {
				script_execute(end_script, noone);
				break;
			}
		}
	}
	ds_list_clear(global_collision_list);
	// Angle or fly towards target
	var target_x = (target.bbox_left + target.bbox_right) / 2;
	var target_y = (target.bbox_top + target.bbox_bottom) / 2;
	var target_dist = point_distance(x,y,target_x,target_y);
	target_x += lengthdir_x(target.spd*(target_dist/spd),target.dir);
	target_y += lengthdir_y(target.spd*(target_dist/spd),target.dir);
	var target_dir = point_direction(x,y,target_x,target_y);
	var angle_diff = abs(angle_difference(target_dir, image_angle));
	var angle_ratio = clamp(track_radius/target_dist,1,5);
	
	// If in flight mode
	if (pspd <= 0) {
		if (angle_diff > angle_ratio) {
			// Turn
			//spd = max(0, spd - accel_rate);
			angle_velocity = turn_towards_angle(image_angle, target_dir, angle_velocity, max_angle_velocity, angle_accel_rate * angle_ratio);
			image_angle += angle_velocity;
	
			var dx = lengthdir_x(decel_rate,dir), dy = lengthdir_y(decel_rate,dir);
			xspd = reduce(xspd,dx);
			yspd = reduce(yspd,dy);
		} else {
			// Burn
			//spd = min(max_spd, spd + accel_rate);
			angle_velocity = turn_towards_angle(image_angle, target_dir,
				angle_velocity, max_angle_velocity, angle_accel_rate);
			image_angle += angle_velocity;
	
			var dx = lengthdir_x(accel_rate,image_angle), dy = lengthdir_y(accel_rate,image_angle);
			xspd += dx;
			yspd += dy;
		}
		spd = min(max_spd, point_distance(0,0,xspd,yspd));
		//if (spd != 0 && angle_ratio < 3) {
			dir = point_direction(0,0,xspd,yspd);
		//} else {
		//	dir = image_angle;
		//}
	}
}

// Initial angling period
if (pspd > 0) {
	pspd = max(0, pspd - accel_rate);
	//spd = max(0, pspd - accel_rate);
	xspd = lengthdir_x(pspd, pdir) + lengthdir_x(spd, dir);
	yspd = lengthdir_y(pspd, pdir) + lengthdir_y(spd, dir);
}

x += xspd;
y += yspd;

update_trail(x,y);