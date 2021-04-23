function reactor_control() {
	if (construction || !instance_exists(parent)) return;
	// Inherit the parent event
	var effectiveness = destroyed ? destroyed_effectiveness : 1;
	with (parent) {
		energy = min(energy_max, energy + other.reactor_energy_rate * effectiveness);
	}
}