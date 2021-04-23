function init_reactor(){
	if (instance_exists(parent)) {
		// Add armor to parent
		with (parent) {
			energy_max += other.reactor_energy_max;
			ds_list_add(reactor_list,other);
		}
	}
}