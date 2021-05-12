function end_bullet(target){
	if (target != noone) {
		with(target) {
			deal_damage(x, y, other.damage_type);
		}
		hit_particles(part_spark,x,y,particle_number_from_damage(damage_type.damage));
	}
	instance_destroy();
}