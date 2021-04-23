function mine_layer_script() {
	if (alarm[0] > 0 || !active) return;
	// Lay mine
	var inst = instance_create_depth(x,y,BULLET_DEPTH,mine);
	with (inst) {
		damage_type = other.damage_type;
	}
	alarm[0] = seconds_to_frames(1.75);
}