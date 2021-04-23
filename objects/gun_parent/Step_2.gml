/// @description Aim gun

// Inherit the parent event
event_inherited();
audio_emitter_position(audio_emitter, x, y, 0);

if (!instance_exists(parent)) return;
audio_emitter_velocity(audio_emitter, parent.xspd, parent.xspd, 0);

var mobility = alarm[0] > 0 ? gun_recoil_mobility : 1;
var effectiveness = get_component_effectiveness() * mobility;
if (effectiveness == 0) return;

var gun_angle_anchor = gun_angle_start + image_angle;
var aim_point_x = parent.aim_point.x_, aim_point_y = parent.aim_point.y_;
var aim_angle = point_direction(offset_x(x,gun_offset_x,gun_offset_y,image_angle),offset_y(y,gun_offset_x,gun_offset_y,image_angle),aim_point_x,aim_point_y);
var gun_angle_difference = angle_difference(gun_angle_anchor, aim_angle);
if (abs(gun_angle_difference) > gun_angle_mobility) {
	aim_angle = gun_angle_anchor - gun_angle_mobility*sign(gun_angle_difference);
}
gun_angle = gun_angle_mobility < 180 ?
	approach_angle_fixed(gun_angle,aim_angle,gun_angle_spd * effectiveness,gun_angle_anchor) :
	approach_angle(gun_angle,aim_angle,gun_angle_spd * effectiveness);
gun_angle_difference = angle_difference(gun_angle_anchor, gun_angle);
if (abs(gun_angle_difference) > gun_angle_mobility) {
	gun_angle = gun_angle_anchor - gun_angle_mobility*sign(gun_angle_difference);
}

if (construction) return;

var fired = false;
//var gun_angle_close = abs(angle_difference(gun_angle, aim_angle)) < 1;
if (parent.inputs[gun_button] && gun_can_fire) {
	// If we have loaded more bullets than the lower limit required, fire
	if (gun_load >= 1) {
		// Fire!
		gun_can_fire = false;
		alarm[0] = gun_rate / effectiveness;
		gun_load -= 1;
		var x_ = x + lengthdir_x(gun_length,gun_angle);
		var y_ = y + lengthdir_y(gun_length,gun_angle);
		repeat(gun_bullet_number) {
			var bullet_ = instance_create_depth(x_+gun_offset_x,y_+gun_offset_y,BULLET_DEPTH,projectile);
			with (bullet_) {
				spd = random_gauss(other.gun_spd * effectiveness,sqrt(other.gun_spd_dev / effectiveness));//other.gun_spd + random_gauss(-other.gun_spd_dev, other.gun_spd_dev);
				dir = random_gauss(other.gun_angle,sqrt(other.gun_dir_dev / effectiveness));
				pspd = other.parent.spd * other.gun_p;
				pdir = other.parent.dir;
				faction = other.parent.faction;
				lifespan = other.gun_lifespan;
				max_lifespan = lifespan;
				image_angle = dir;
				damage_type = other.gun_type;
				scrap_ratio = other.gun_scrap;
				image_xscale = other.gun_scale;
				image_yscale = other.gun_scale;
				effect = effectiveness;
				weapon_parent = other;
				size_time = other.gun_size_time;
			}
		}
		use_energy();
		fired = true;
		audio_play_sound_on(audio_emitter,gun_sound,false,0);
	}
}

if (!fired && alarm[0] <= 0) {
	// If we can load more bullets, go for it
	if (gun_load < gun_reload) {
		gun_load += gun_reload_rate * effectiveness;
		gun_can_fire = gun_load >= gun_reload_limit;
	}
}
