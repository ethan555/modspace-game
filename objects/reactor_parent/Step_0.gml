/// @description Generate Energy for the Ship

with (parent) {
	energy = clamp(energy + other.reactor_energy_rate,0,energy_max);
}
