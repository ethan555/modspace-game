/*
damage_ : int, amount of damage
type_	: {
	damage		: base damage
	armor		: multiplier against armor
	shields		: multiplier against shields
	fire		: fire damage inflicted
	electric	: power damage inflicted
	force		: knockback
	scrap		: scrap ratio, 0 to 1
}
scrap_ratio_ : How much to scrap the ship by
*/
	
function deal_damage(x_, y_, type_) {
	// Deal the damage to shields, armor, etc.
	var d = type_.damage * effect;
	var hp_damage = 0;
	with (parent) {
		// Deal energy damage
		energy = max(0, energy - type_.electric);
		// Reset shield refresh counter
		if (type_.electric > 0)
			shield_refresh_counter = max(-(d * type_.electric * SHIELD_DAMAGE_TIME), - shield_refresh_time);
		else
			shield_refresh_counter = 0;
		
		if (shields > 0) {
			// Do shields effects
			part_particles_create(part_system,x_,y_,part_shieldhit,1);
			screenshake_distance(1,1);
			var shield_damage = min(shields, type_.shields * d);
			shields -= shield_damage;
			d -= shield_damage / type_.shields;
			for(var i = 0, length = ds_list_size(shield_list); i < length; i++) {
				// Trigger shield effect
				var shield = shield_list[| i];
				if (shield.shield_effect == noone) continue;
				script_execute(shield.shield_effect, shield_damage);
			}
		}
		if (d <= 0) return;
		if (armor > 0) {
			// Do armor effects
			part_particles_create(part_system,x_,y_,part_armorhit,1);
			screenshake_distance(2,2);
			var armor_damage = min(armor, type_.armor * d);
			armor -= armor_damage;
			d -= armor_damage / type_.armor;
			for(var i = 0, length = ds_list_size(armor_list); i < length; i++) {
				// Trigger shield effect
				var shield = armor_list[| i];
				if (shield.armor_effect == noone) continue;
				script_execute(shield.armor_effect, shield_damage);
			}
		}
		if (d <= 0) return;
		
		var hp_prev = hp;
		hp = clamp(hp - d, 0, hp);
		var hp_difference = hp_prev - hp;
		hp_damage = d;
		var scrap_damage_dealt = type_.scrap * hp_difference;
		scrap_damage += scrap_damage_dealt;
		script_execute(hit_script,x_,y_);
		var scrap_amount = particle_number_from_damage(scrap_damage_dealt);
		if (scrap_amount > 0)
			part_particles_create(part_system,x_,y_,part_scrap,scrap_amount);
	}
	if (parent.id != self.id) {
		hp -= hp_damage;
		
		if (parent.hp <= 0 && !parent.destroyed) {
			with (parent) {
				if (explosion_script != noone) script_execute(explosion_script);
			}
		} else if (hp <= 0) {
			if (explosion_script != noone) script_execute(explosion_script);
		}
	} else if (hp <= 0) {
		if (explosion_script != noone) script_execute(explosion_script);
	}
	
}