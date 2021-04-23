function use_energy(){
	with (parent) {
		energy = max(-energy_max, energy - other.energy_use);
	}
}