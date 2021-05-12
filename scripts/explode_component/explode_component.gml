function explode_component() {
	// The parent builds up scrap damage, which gives the chance of component destruction
	var destroyed_chance = parent.scrap_damage / parent.hp_max;
	var destroyed_actual = random(1);
	if (destroyed_actual <= destroyed_chance) instance_destroy();
	destroy_part();
	spd = max(weight, other.spd + random_range(-2,5) / weight);
	dir = other.dir + random(25) / weight;
	spin = random_range(-5,5) / weight;
}