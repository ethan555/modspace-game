function hit_ship(x_,y_) {
	screenshake_distance(3,5);
	part_particles_create(part_system,x_,y_,choose_explosion(),1);
}