// Dummy variable target
function end_explosive(target) {
	// Explode
	create_explosion(explosion)
	screenshake_distance(screenshake_amount,screenshake_time);
	hit_particles(part_spark,x,y,particle_number_from_damage(damage_type.damage));
	instance_destroy();
}