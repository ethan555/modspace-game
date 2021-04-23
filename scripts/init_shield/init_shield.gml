function init_shield(){
	if (instance_exists(parent)) {
		// Add armor to parent
		with (parent) {
			shields += other.shields;
			ds_list_add(shield_list,other);
		}
	}
}