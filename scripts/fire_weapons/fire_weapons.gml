function fire_weapons(distance_){
	if (distance_ <= primary_range) {
		inputs[PRIMARY] = true;
	} else {
		inputs[PRIMARY] = false;
	}
		
	if (distance_ <= secondary_range) {
		inputs[SECONDARY] = true;
	} else {
		inputs[SECONDARY] = false;
	}
	
	aim_point = aim_at_target(distance_, projectile_speed);
}