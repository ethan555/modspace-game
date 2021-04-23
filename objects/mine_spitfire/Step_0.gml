/// @description Shoot bullets

// Inherit the parent event
event_inherited();

if (!bullet_can_fire) return;

for (var i = 0; i < 360; i+=bullet_angle) {
    // Shoot bullets
	repeat(bullet_number) {
		var inst = instance_create_depth(x,y,BULLET_DEPTH,mine_bullet);
		with (inst) {
			damage_type = other.damage_type;
			spd = random_gauss(other.bullet_spd,other.bullet_spd_dev);
			dir = random_gauss(other.image_angle+i,other.bullet_dir_dev);
			
			faction = other.faction;
			lifespan = other.bullet_lifespan;
			max_lifespan = lifespan;
			image_angle = dir;
			image_xscale = other.bullet_scale;
			image_yscale = other.bullet_scale;
		}
	}
}

bullet_can_fire = false;
alarm[0] = bullet_rate;