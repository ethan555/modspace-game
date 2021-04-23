function get_component_effectiveness(){
	var destroyed_effect = destroyed ? destroyed_effectiveness : 1;
	var energy_effect = parent.energy > energy_required ? 1 : energy_effectiveness;
	var effectiveness = destroyed_effect * energy_effect;
	return effectiveness;
}