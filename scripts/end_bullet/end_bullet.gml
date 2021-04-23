function end_bullet(target){
	if (target != noone) {
		with(target) {
			deal_damage(x, y, other.damage_type);
		}
	}
	instance_destroy();
}