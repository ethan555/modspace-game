// dist_x, dist_y: 1: infinitely far away, > 1: closer
function bg_struct(x_,y_,sprite_,dist_x_,dist_y_,scale_,rotation_,color_,alpha_,tiled_) constructor {
	sprite = sprite_;
	xx = x_;
	yy = y_;
	dist_x = dist_x_;
	dist_y = dist_y_;
	scale = scale_;
	bg_rotation = rotation_;
	bg_color = color_;
	alpha = alpha_;
	tiled = tiled_;
}

function reset_backgrounds() {
	if (instance_exists(background_drawer)) {
		with (background_drawer) {
			for (var i = 0, length = array_length(background_data); i < length; ++i) {
				background_data[i] = noone;
			}
		}
	}
}

function set_background(bg_struct_, index) {
	var i = modulo(index,5);
	if (instance_exists(background_drawer)) {
		with (background_drawer) {
			background_data[i] = bg_struct_;
		}
	}
}