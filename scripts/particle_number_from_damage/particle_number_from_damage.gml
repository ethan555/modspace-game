function particle_number_from_damage(damage_) {
	var number = clamp(damage_,3,10);
	return round(random_gauss(number,sqrt(number)));
}