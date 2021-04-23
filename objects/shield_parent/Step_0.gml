/// @description Drain energy, restore shields
if (parent == noone || !instance_exists(parent)) return;
if (parent.shields >= parent.shields_max || parent.shield_refresh_counter < shield_refresh_time) return;
var destroyed_effect = destroyed ? destroyed_effectiveness : 1;
var energy_effect = max(energy_effectiveness, parent.energy / parent.energy_max);
var effect = destroyed_effect * energy_effect;
with (parent) {
	shields = min(shields_max, shields + other.shield_regen_rate * effect);
}
use_energy();
