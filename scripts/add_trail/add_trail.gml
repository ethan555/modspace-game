function trail_struct(x_, y_, length_, width1_, width2_, alpha1_, alpha2_, color_) constructor {
	destroyed = -1;
	data = new trail_data_struct(length_, width1_, width2_, alpha1_, alpha2_, color_);
	trail_array = array_create(length_);
	for (var i = 0; i < length_; i++) {
		trail_array[i] = new trail_point_struct(x_,y_);
	}
}

function trail_data_struct(length_, width1_, width2_, alpha1_, alpha2_, color_) constructor {
	index = 0;
	trail_length = length_;
	width1 = width1_;
	width2 = width2_;
	alpha1 = alpha1_;
	alpha2 = alpha2_;
	trail_color = color_;
}

function trail_point_struct(xx, yy) constructor {
	x_ = xx;
	y_ = yy;
}

function add_trail(x_, y_, length, width1, width2, alpha1, alpha2, color) {
	/*var data_struct_ = new trail_data_struct(width1, width2, alpha1, alpha2, color);
	var trail_struct_ = new trail_struct(x_,y_);
	var trail_array = //ds_grid_create();length,trail_struct_);
	trail_array[0] = data_struct_;*/
	var new_trail = new trail_struct(x_, y_, length, width1, width2, alpha1, alpha2, color);
	ds_map_add(trail_map,id,new_trail);
}

function remove_trail() {
	if (ds_exists(trail_map, ds_type_map)) trail_map[? id].destroyed = 0;
	//ds_map_delete(trail_map,id);
}

function update_trail(x_, y_) {
	trail_map[? id].data.index = modulo(trail_map[? id].data.index + 1, trail_map[? id].data.trail_length);
	var index = trail_map[? id].data.index;
	var trail_point = trail_map[? id].trail_array[index];
	trail_point.x_ = x_;
	trail_point.y_ = y_;
	//trail_map[? id].trail_array[index] = trail_point;
	//trail_map[? id].trail_array[index] = new trail_point_struct(x_, y_);
	//trail_map[? id].trail_array[index].x_ = x_;
	//trail_map[? id].trail_array[index].y_ = y_;
}