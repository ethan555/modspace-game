/// @description Draw the trails

//var trail_structures = ds_map_values_to_array(trail_map);
var trail_keys = ds_map_keys_to_array(trail_map);
for (var i = 0, trail_number = array_length(trail_keys); i < trail_number; i++) {
	var trail_key = trail_keys[i];
	var trail_structure = trail_map[? trail_key];
	// Element 0 is struct
	// index_, width1_, width2_, alpha1_, alpha2_, color_
	var trail_destroyed = trail_structure.destroyed;
	var trail_array = trail_structure.trail_array;
	var trail_stats = trail_structure.data;
	var trail_index = trail_stats.index;
	var trail_width1 = trail_stats.width1;
	var trail_width2 = trail_stats.width2;
	var trail_alpha1 = trail_stats.alpha1;
	var trail_alpha2 = trail_stats.alpha2;
	var trail_color = trail_stats.trail_color;
	var trail_length = trail_stats.trail_length;
	var trail_decay = 1/trail_length;
	var decay_amount = 1;
	
	if (trail_destroyed >= trail_length) {
		ds_map_delete(trail_map, trail_key);
		continue;
	}
	
	var index_offset = max(0,trail_destroyed);
	
	var last_x = -100000, last_y = -100000;
	
	// Update trail array
	//trail_stats.index = modulo(trail_index + 1, trail_length);
	//trail_structure.data = trail_stats;
	
	draw_primitive_begin(pr_trianglestrip);
	
	/// Could have also done modulo shenanigans, but this is easier
	// Start the trail
	for (var j = trail_index + 1 + index_offset; j < trail_length; j++) {
		// Each trail element is struct
		// x_, y_;
		var trail_struct = trail_array[j];
		var x_ = trail_struct.x_;
		var y_ = trail_struct.y_;
		
		if (x_ == last_x && y_ == last_y) {continue;}
		
		var next_index = j + 1;
		if (next_index >= trail_length) next_index = 0;
		var next_trail = trail_array[next_index];
		var x_next = next_trail.x_;
		var y_next = next_trail.y_;
		
		var dir = point_direction(x_,y_,x_next,y_next);
		var odir = dir + 90;
		var alpha = lerp(trail_alpha1,trail_alpha2,decay_amount);
		var width = lerp(trail_width1,trail_width2,decay_amount);
		var d = width/2;
		var d_x = lengthdir_x(d,odir);
		var d_y = lengthdir_y(d,odir);
		decay_amount -= trail_decay;
		
		draw_vertex_color(x_ - d_x, y_ - d_y, trail_color, alpha);
		draw_vertex_color(x_ + d_x, y_ + d_y, trail_color, alpha);
		
		last_x = x_;
		last_y = y_;
	}
	// End the trail
	var odir = 0;
	var end_offset = max(0, trail_index + 1 + index_offset - trail_length);
	for (var j = 0 + end_offset; j < trail_index; j++) {
		// Each trail element is struct
		// x_, y_;
		var trail_struct = trail_array[j];
		var x_ = trail_struct.x_;
		var y_ = trail_struct.y_;
		
		if (x_ == last_x && y_ == last_y) {continue;}
		
		var next_index = j + 1;
		//if (next_index >= trail_length) next_index = 0;
		var next_trail = trail_array[next_index];
		var x_next = next_trail.x_;
		var y_next = next_trail.y_;
		
		var dir = point_direction(x_,y_,x_next,y_next);
		odir = dir + 90;
		var alpha = lerp(trail_alpha1,trail_alpha2,decay_amount);
		var width = lerp(trail_width1,trail_width2,decay_amount);
		var d = width/2;
		var d_x = lengthdir_x(d,odir);
		var d_y = lengthdir_y(d,odir);
		decay_amount -= trail_decay;
		
		draw_vertex_color(x_ - d_x, y_ - d_y, trail_color, alpha);
		draw_vertex_color(x_ + d_x, y_ + d_y, trail_color, alpha);
		
		last_x = x_;
		last_y = y_;
	}
	
	var trail_struct = trail_array[trail_index];
	var x_ = trail_struct.x_;
	var y_ = trail_struct.y_;
	var alpha = lerp(trail_alpha1,trail_alpha2,decay_amount);
	var width = lerp(trail_width1,trail_width2,decay_amount);
	var d = width/2;
	var d_x = lengthdir_x(d,odir);
	var d_y = lengthdir_y(d,odir);
		
	draw_vertex_color(x_ - d_x, y_ - d_y, trail_color, alpha);
	draw_vertex_color(x_ + d_x, y_ + d_y, trail_color, alpha);
	
	if (trail_destroyed >= 0) {
		trail_map[? trail_key].destroyed ++;
	}
	
	draw_primitive_end();
}
