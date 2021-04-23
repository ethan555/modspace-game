function init_armor(){
	if (instance_exists(parent)) {
		// Add armor to parent
		with (parent) {
			armor += other.armor_rating;
			ds_list_add(armor_list,other);
		}
	}
}