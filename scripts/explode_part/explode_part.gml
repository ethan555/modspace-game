function explode_part() {
	destroy_part();
	spd = max(weight, other.spd + random_range(-2,5) / weight);
	dir = other.dir + random(25) / weight;
	spin = random_range(-5,5) / weight;
}