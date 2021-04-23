function flare_data(sprite_, time_, number_, length_mean_, length_dev_, width_mean_, width_dev_, alpha1_, alpha2_, angle_, color_) constructor {
	sprite = sprite_;
	flare_color = color_;
	number = number_;
	time = time_;
	next_time = time_ * (1 - 1 / number);
	flare_index = 0;
	flare_array = array_create(number_);
	length1 = length_mean_;
	length2 = length_dev_;
	width1 = width_mean_;
	width2 = width_dev_;
	alpha1 = alpha1_;
	alpha2 = alpha2_;
	flare_angle = angle_;
	for (var i = 0; i < number_; i++) {
		//var angle = random_gauss(0, sqrt(angle_));
		//var angle_ratio = 1 - (angle / angle_);
	    flare_array[i] = new flare_struct(
			0,
			0,//angle,
			0,//angle_ratio
			0,
			0
		);
	}
}

function flare_struct(time_, length_, width_, angle_, angle_ratio_) constructor {
	time = time_;
	flare_length = length_;
	flare_width = width_;
	angle = angle_;
	angle_ratio = angle_ratio_;
}

function draw_flares(engine_flares, add_flare) {
	var engine_flare_array = engine_flares.flare_array;
	
	for (var i = 0; i < engine_flares.number; ++i) {
		var flare = engine_flare_array[i];
		if (flare.time <= 0) continue;
		
		var flare_time_ratio = flare.time / engine_flares.time;
		var flare_decay = flare.time < engine_flares.time * .75;
		// Draw each flare
	    draw_sprite_ext(engine_flares.sprite,
			(sprite_get_number(engine_flares.sprite) - 1) * (1 - flare_time_ratio),
			x, y,
			lerp(engine_flares.length2, engine_flares.length1, flare_time_ratio),//flare.flare_length,
			lerp(engine_flares.width2, engine_flares.width1, flare_time_ratio),//flare.flare_width,
			flare.angle,
			engine_flares.flare_color,
			flare_decay ?
				lerp(engine_flares.alpha2, engine_flares.alpha1, flare_time_ratio) :
				lerp(engine_flares.alpha1, engine_flares.alpha2, flare_time_ratio)
		);
		flare.time = max(0, flare.time - 1);
	}
	// Update the flares
	if (add_flare && engine_flare_array[engine_flares.flare_index].time <= engine_flares.next_time) {
		engine_flares.flare_index = modulo(engine_flares.flare_index + 1, engine_flares.number);
		engine_flare_array[engine_flares.flare_index].time = engine_flares.time;
		var angle = random_gauss(0, sqrt(engine_flares.flare_angle));
		var angle_ratio = 1 - (abs(angle) / engine_flares.flare_angle);
		
		var length = random_gauss(engine_flares.length1, engine_flares.length2);
		var width = random_gauss(engine_flares.width1, engine_flares.width2);
		
		engine_flare_array[engine_flares.flare_index].flare_length = length;
		engine_flare_array[engine_flares.flare_index].flare_width = width;
		engine_flare_array[engine_flares.flare_index].angle = image_angle + angle;
		engine_flare_array[engine_flares.flare_index].angle_ratio = angle_ratio;
	}
}
