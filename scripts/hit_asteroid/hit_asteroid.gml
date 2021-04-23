function hit_asteroid(x_,y_){
	screenshake_distance(3,5);
	part_particles_create(part_system,x_,y_,part_asteroid,irandom_range(1,5));
}