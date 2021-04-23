function collision_set_add(collided_set_, collision_) {
	ds_map_add(collided_set_,collision_,COLLISION_TIMER);
}

function collision_set_countdown(collided_set_) {
	var collision_set_keys = ds_map_keys_to_array(collided_set_);
	for (var i = 0, length = array_length(collision_set_keys); i < length; ++i) {
		var collision_ = collision_set_keys[i];
		var collision_time_ = collided_set_[? collision_];
	    if (collision_time_ > 0) {
			collided_set_[? collision_] = collision_time_ - 1;
		} else {
			ds_map_delete(collided_set_,collision_);
		}
	}
}