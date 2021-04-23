function place_adjacent(x_, y_) {
	return place_meeting(x_-1,y_,layout_parent) || place_meeting(x_+1,y_,layout_parent) || place_meeting(x_,y_-1,layout_parent) || place_meeting(x_,y_+1,layout_parent)
		|| place_meeting(x_-1,y_,ship_parent) || place_meeting(x_+1,y_,ship_parent) || place_meeting(x_,y_-1,ship_parent) || place_meeting(x_,y_+1,ship_parent);
}