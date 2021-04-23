function dialogue_struct(speaker_, faction_, dialogue_) constructor {
	speaker = speaker_;
	faction = faction_;
	dialogue = dialogue_;
}

function dialogue_data(dialogue_type_, dialogue_types_array_, dialogue_type_dist_) constructor {
	dialogue_type = dialogue_type_;
	dialogue_types_array = dialogue_types_array_;
	dialogue_type_dist = dialogue_type_dist_;
}

function add_dialogue(speaker_, faction_, dialogue_, target_) {
	dialogue_index = modulo(dialogue_index+1,array_length(dialogue_buffer));
	dialogue_buffer[dialogue_index] = new dialogue_struct(speaker_, faction_, dialogue_);
}